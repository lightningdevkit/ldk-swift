import {default as debugModule} from 'debug';
import Config from './config.mjs';
import fs from 'fs';
import {
	ContextualRustType,
	OpaqueRustStruct,
	RustArray,
	RustFunction,
	RustFunctionArgument,
	RustFunctionReturnValue,
	RustKind,
	RustLambda,
	RustNullableOption,
	RustPrimitive,
	RustPrimitiveEnum,
	RustPrimitiveEnumVariant,
	RustPrimitiveWrapper,
	RustResult,
	RustResultValueEnum,
	RustStruct,
	RustStructField,
	RustTaggedValueEnum,
	RustTrait,
	RustTuple,
	RustType,
	RustVector
} from './rust_types.mjs';

const debug = debugModule('ldk-parser:parser');

const STRICT_FUNCTION_REGEX = /([A-Za-z_0-9\* ]* \*?)([a-zA-Z_0-9]*)\((.*)\);$/;
const FUNCTION_REGEX = /^([A-Za-z_0-9\* ]* \*?)(([a-zA-Z_0-9]*)\((.*)\)(\[\d+\])?);$/;
const STRICT_LAMBDA_REGEX = /^(struct |enum |union )?([A-Za-z_0-9]* \*?)\(\*([A-Za-z_0-9]*)\)\((const )?void \*this_arg(.*)\);$/;
const LAMBDA_REGEX = /^(struct |enum |union )?([A-Za-z_0-9]* \*?)\(\*([A-Za-z_0-9]*)\)\(((const )?void \*this_arg)?(.*)\);$/;
const ARRAY_POINTER_REGEX = /^\(\*(.+)\)\[(\d+)\]$/;

export default class Parser {

	private headerFile: string;
	/**
	 * All the types
	 * @private
	 */
	private typeGlossary: { [name: string]: RustType } = {};
	/**
	 * Free-floating functions without an associated type
	 */
	private floatingFunctions: RustFunction[] = [];
	private kindsWithMethodAssociations = new Set();

	constructor(config: Config) {
		this._config = config;
	}

	private _config: Config;

	get config() {
		return this._config;
	}

	get glossary() {
		return this.typeGlossary;
	}

	get functions() {
		return this.floatingFunctions;
	}

	parse() {
		// first, read the header file
		this.readHeaderFile();

		// second, collect all types and methods
		this.collectRawTypes();
	}

	private readHeaderFile() {
		const headerPath = this.config.getHeaderPath();
		const headerData = fs.readFileSync(headerPath);
		this.headerFile = headerData.toString();
	}

	private collectRawTypes() {
		// iterate through the header file and find everything

		const headerLines = this.headerFile.split('\n');
		let isBlockComment = false;
		let aggregateComment = '';
		let blockComment = '';
		let aggregateBlockObject = '';
		let objectLines: ObjectLine[] = [];
		for (let currentLine of headerLines) {
			currentLine = currentLine.trim();
			// handle comments
			{
				if (currentLine.startsWith('/*')) {
					isBlockComment = true;
					aggregateComment = '';
				}
				if (isBlockComment) {
					// remove leading and trailing comment delimiters
					let currentCommentLine = currentLine
					// remove trailing comment delimiters
					.replace(new RegExp('\\*+\\/$', ''), '')
					// remove leading comment delimiters
					.replace(new RegExp('^/?\\*+', ''), '')
					.trim();
					if (currentCommentLine.length > 0) {
						aggregateComment += currentCommentLine;
					}
				}
				if (currentLine.endsWith('*/')) {
					isBlockComment = false;
					continue;
				} else if (isBlockComment) {
					aggregateComment += '\n';
				}

				if (isBlockComment) {
					continue;
				}
			}

			// handle the real stuff
			if (currentLine.length === 0) {
				// outside of comments, empty lines are useless
				continue;
			}

			if (aggregateBlockObject.length > 0) {
				// we are in the midst of parsing a block object
				if (currentLine.startsWith('} ')) {
					/**
					 * Tt's over. Now the block object has ended.
					 *
					 * Note that the reason we don't confuse it with an inner block termination
					 * like the `union { struct {}; };` inside e. g. `LDKBech32Error` is because
					 * all inner blocks end in '};' – i. e. no space, but a semicolon.
					 *
					 * Should that change, we'll need to add a scope depth tracker.
					 */

					const currentBlockObject = aggregateBlockObject;
					aggregateBlockObject = '';

					const currentComment = blockComment.trim();
					blockComment = '';
					aggregateComment = '';

					const currentObjectLines = objectLines.slice(0, objectLines.length);
					objectLines = [];

					this.parseExplicitlyDefinedType(currentBlockObject, currentComment, currentObjectLines);
				} else {
					objectLines.push({code: currentLine, comments: aggregateComment.trim()});
					aggregateComment = '';
				}
			} else if (currentLine.startsWith('typedef')) {
				// memoize the completed comment for the block, because there are gonna be
				// smaller comments inside the object
				blockComment = aggregateComment;

				// make the aggregate block object non-empty so we know we're actively writing one
				aggregateBlockObject += currentLine;

				// initialize for the next thing
				aggregateComment = '';
			} else if (FUNCTION_REGEX.test(currentLine)) {
				const currentComment = aggregateComment.trim();
				aggregateComment = '';

				this.parseMethod(currentLine, currentComment);
			} else {
				/**
				 * This is the tail end of what could happen on a line.
				 * We're outside of a block object, we're not declaring one, nor have we just closed
				 * one. All the functions should be here.
				 */
				if (currentLine.startsWith('#include <') || currentLine.startsWith('#include \"') || currentLine.startsWith('extern const') || currentLine.startsWith('#if') || currentLine.startsWith('#endif') || currentLine.startsWith('#define')) {
					continue;
				}
				throw new Error('Unparsed line:\n' + currentLine);
			}

		}
	}

	/**
	 * Basically any type that starts with a typedef declaration. Struct, enum, union
	 * @private
	 */
	private parseExplicitlyDefinedType(blockObject: string, docComment: string, objectLines: ObjectLine[]) {
		const NAME_REGEX = /^typedef (struct|enum|union) (MUST_USE_STRUCT )?(LDK[A-Za-z_0-9]*) {$/;
		const TUPLE_NAME_REGEX = /^LDKC[0-9]+Tuple_/;
		const matches = NAME_REGEX.exec(blockObject);
		if (matches && matches.length > 0) {
			const type = matches[1];
			const mustUseStruct = !!matches[2];
			const name = matches[3];

			let descriptor = this.typeGlossary[name];
			if (!descriptor) {
				if (type === 'enum') {
					// either unitary, or union enum
					const isUnitaryEnum = name.endsWith('_Tag');
					descriptor = new RustPrimitiveEnum();
				} else if (type === 'struct') {

					/**
					 * There are several indications that a struct is actually an enum with associated values
					 * 1) it only contains two fields (the tag and the union)
					 * 2) its name with _Tag appended to it already exists in the glossary, and is a `RustPrimitiveEnum`
					 * i. e. if our struct is LDKBech32Error, then we already know about LDKBech32Error_Tag,
					 * which is a primitive enum
					 * 3) its first field is a tag
					 * 4) its second field is the union
					 */

					/**
					 * Separately, there may also be an indication that a struct is actually a Result
					 * 1) If the name starts with LDKCResult_
					 * 2) If the name ends with Z
					 * 3) If the name with Ptr appended to it already exists in the glossary
					 * 4) Aforementioned glossary entry is of type `RustResultValueEnum`
					 */

					/**
					 * A particularly hard to detect situation is when the struct is really
					 * a wrapper around either a primitive or a primitive array that should be
					 * elided. Examples of such types are
					 * LDKStr, LDKBigEndianScalar, LDKU5, LDKTransaction, LDKu8slice, LDKBigEndianScalar,
					 * and many, many, more.
					 * The indications are really varied, because there are multiple breakdowns:
					 * a) is it a wrapper over one primitive (LDKU5, LDKWitnessVersion), or over an
					 * array of primitives (all other instances)
					 * b) if it's a wrapper over an array, is it fixed-length or variable-length?
					 * Fixed-length examples are LDKRecoverableSignature, LDKBigEndianScalar.
					 * Variable-length examples are LDKStr, LDKu8slice, LDKTransaction
					 * c) what's the name of the field that contains the data?
					 * Examples are big_endian_bytes (LDKBigEndianScalar), *chars (LDKStr)
					 * d) if variable-length, what's the name of the field that contains the length?
					 * Currently, it's datalen for all fields except LDKStr, where it's len
					 * e) is this type ownable and, if so, what's the name of the ownership
					 * indication field?
					 * LDKTransaction is ownable (is_owned), as is LDKStr (chars_is_owned)
					 *
					 * So all these inconsistent indications beg the question: how do we find
					 * one of those things? The current approach is rather imprecise:
					 * if a struct contains between 1 and 3 fields, and all of them are either
					 * primitives or primitive arrays
					 *
					 * Because this detection is so difficult to do prior to parsing the type,
					 * we first parse it, and then try to do a conversion where we try to infer
					 * the responsibility of each field.
					 *
					 * However, this approach has drawbacks. Types like
					 * LDKHTLCDestination_LDKUnknownNextHop_Body end up caught in the dragnet
					 * that way. But perhaps it makes sense to just elide those types, as well
					 */

					/**
					 * Lastly, a struct may also be a trait. That happens if any one of its fields
					 * is a lambda. That's right, we don't mix and match.
					 * We check lambda presence using a simple regex.
					 */

					const hypotheticalTagName = name + '_Tag';
					const hypotheticalResultEnumName = name + 'Ptr';
					if (hypotheticalTagName in this.typeGlossary && this.typeGlossary[hypotheticalTagName] instanceof RustPrimitiveEnum) {
						// it's an enum with associated values, buddy, not a conventional struct
						descriptor = new RustTaggedValueEnum();
						const primitiveEnum = this.typeGlossary[hypotheticalTagName] as RustPrimitiveEnum;
						let enumVariants = primitiveEnum.variants;
						if (enumVariants.length === 2) {
							const variantAName = enumVariants[0].name;
							const variantBName = enumVariants[1].name;
							if ((variantAName.endsWith('_Some') && variantBName.endsWith('_None')) || (variantAName.endsWith('_None') && variantBName.endsWith('_Some'))) {
								descriptor = new RustNullableOption();
							}
						}
						primitiveEnum.parentType = descriptor;

					} else if (hypotheticalResultEnumName in this.typeGlossary && this.typeGlossary[hypotheticalResultEnumName] instanceof RustResultValueEnum) {
						const resultValueEnum = this.typeGlossary[hypotheticalResultEnumName];
						descriptor = new RustResult();
						resultValueEnum.parentType = descriptor;
					} else if (this.containsLambdas(objectLines)) {
						descriptor = new RustTrait();
					} else if (name.startsWith('LDKCVec_')) {
						descriptor = new RustVector();
					} else if (TUPLE_NAME_REGEX.test(name)) {
						descriptor = new RustTuple();
					} else {
						descriptor = new RustStruct();
					}
				} else if (type === 'union') {
					if (name.startsWith('LDKCResult_')) {
						// these are all the different values that a Result type may assume
						descriptor = new RustResultValueEnum();
					} else {
						debug('Unimplemented union type: %s', name);
						process.exit(1);
					}
				}
			}
			descriptor.name = name;
			descriptor.documentation = docComment;
			this.typeGlossary[name] = descriptor;

			if (descriptor instanceof RustPrimitiveEnum) {
				for (const currentValueLine of objectLines) {
					const currentValue = this.parseEnumValue(currentValueLine);
					if (currentValue) {
						descriptor.variants.push(currentValue);
					}
				}
			} else if (descriptor instanceof RustTrait) {
				// RustTrait inherits from RustStruct, so its check must come first
				for (const currentLambdaLine of objectLines) {
					if (!LAMBDA_REGEX.test(currentLambdaLine.code)) {
						const currentField = this.parseStructField(currentLambdaLine);
						if (currentField.contextualName === 'this_arg') {
							descriptor.identifierField = currentField;
						} else {
							debug('Trait `%s` has transparent field `%s: %s`', descriptor.name, currentField.contextualName, currentField.type.typeDescription);
							descriptor.fields[currentField.contextualName] = currentField;
						}
						descriptor.orderedFields.push(currentField);
						continue;
					}
					const currentLambda = this.parseLambda(currentLambdaLine);
					descriptor.lambdas.push(currentLambda);
					descriptor.orderedFields.push(currentLambda);
				}
			} else if (descriptor instanceof RustStruct) {
				for (const currentFieldLine of objectLines) {
					const currentField = this.parseStructField(currentFieldLine);
					if(currentField.contextualName.includes('owned') && currentField.type instanceof RustPrimitive){
						descriptor.ownershipField = currentField;
					}
					if (descriptor instanceof RustVector) {
						if (currentField.contextualName === 'data') {
							descriptor.iterateeField = currentField;
						} else if (currentField.contextualName === 'datalen') {
							descriptor.lengthField = currentField;
						} else {
							console.error(`Unexpected field name inside vector ${descriptor.name}: ${currentField.contextualName}\n>`, currentFieldLine.code);
							process.exit(1);
						}
					} else if (descriptor instanceof RustTuple) {
						// tuples need a sequential representation of their fields
						descriptor.orderedFields.push(currentField);
					}
					descriptor.fields[currentField.contextualName] = currentField;
				}
				if (this.isPrimitiveWrapper(descriptor)) {
					// try to detect if this is a primitive wrapping struct
					debug('Primitive wrapper detected: `%s`', descriptor.name);

					// DANGER ZONE! Overwrite the glossary entry with the newly parsed descriptor
					// TODO: figure out a way to detect wrapper type before object lines are parsed
					descriptor = this.parsePrimitiveWrapper(descriptor);
					this.typeGlossary[name] = descriptor;
				}
			} else if (descriptor instanceof RustResultValueEnum) {
				for (const currentEnumLine of objectLines) {
					const currentVariant = this.parseStructField(currentEnumLine);
					if (currentVariant.contextualName === 'result') {
						descriptor.resultVariant = currentVariant;
					} else if (currentVariant.contextualName === 'err') {
						descriptor.errorVariant = currentVariant;
					} else {
						console.error(`Unexpected variant name inside result value enum ${descriptor.name}: ${currentVariant.contextualName}\n>`, currentEnumLine.code);
						process.exit(1);
					}
				}
			} else if (descriptor instanceof RustResult) {
				for (const currentFieldLine of objectLines) {
					const currentField = this.parseStructField(currentFieldLine);
					if (currentField.contextualName === 'contents') {
						descriptor.valueField = currentField;
					} else if (currentField.contextualName === 'result_ok') {
						descriptor.tagField = currentField;
					} else {
						console.error(`Unexpected field inside result ${descriptor.name}: ${currentField.contextualName}\n>`, currentFieldLine.code);
						process.exit(1);
					}
				}
			} else if (descriptor instanceof RustTaggedValueEnum) {
				let isInsideUnion = false;
				let structDepth = 0;
				for (const [i, currentEnumLine] of objectLines.entries()) {
					if (currentEnumLine.code.startsWith('union {') && !isInsideUnion) {
						isInsideUnion = true;
					} else if (currentEnumLine.code.startsWith('struct {') && isInsideUnion) {
						structDepth++;
					} else if (currentEnumLine.code === '};') {
						if (structDepth > 0) {
							structDepth--;
						} else {
							isInsideUnion = false;
						}
					} else {
						if (i === 0 && !isInsideUnion) {
							const tagField = this.parseStructField(currentEnumLine);
							/**
							 * The tag variants are named LDKEnum_VariantName (with type prefix, and camel case)
							 * If a variant were to contain an associated type, like LDKPaymentSendFailure's
							 * partial_failure variant (LDKPaymentSendFailure_PartialFailure),
							 * its corresponding type could be identified from the tag's enum variant,
							 * because it's LDKPaymentSendFailure_LDKPartialFailure_Body
							 *
							 * That's why we have to iterate through the variant tags here and
							 * identify any type that might actually belong to this complex / tagged value enum
							 *
							 * There's still one complication, however:
							 * The variant name is "LDKPaymentSendFailure_PartialFailure,"
							 * but the type name is LDKPaymentSendFailure_LDKPartialFailure_Body
							 * (note the "LDK" infix)
							 */
							descriptor.variantTag = tagField;

							for (const currentPrimitiveVariant of (tagField.type as RustPrimitiveEnum).variants) {
								const searchString = descriptor.name + '_';
								const replacementString = descriptor.name + '_LDK';
								const potentialChildTypeName = currentPrimitiveVariant.name.replace(searchString, replacementString) + '_Body';
								if (this.typeGlossary[potentialChildTypeName]) {
									const childType = this.typeGlossary[potentialChildTypeName];
									childType.parentType = descriptor;
								}
							}

						} else {
							const currentVariant = this.parseStructField(currentEnumLine);
							currentVariant.documentation = currentEnumLine.comments;

							// the actual variant accessors are just named variant_name (no type prefix, and snake case)
							if (descriptor instanceof RustNullableOption) {
								if (currentVariant.contextualName !== 'some') {
									console.error(`Unexpected variant name inside binary option: ${currentVariant.contextualName}\n>`, currentEnumLine.code);
									process.exit(1);
								}
								if (descriptor.someVariant) {
									console.error('Duplicate attempt to set `some` variant of binary option:\n>', currentEnumLine.code);
									process.exit(1);
								}
								descriptor.someVariant = currentVariant;
							}

							descriptor.variants[currentVariant.contextualName] = currentVariant;
						}
					}

				}
				// const tagField = this.parseStructField(obj)
			}
		}
	}

	private isPrimitiveWrapper(descriptor: RustStruct): boolean {
		if (descriptor instanceof RustVector) {
			return false;
		}
		if (descriptor instanceof RustTuple) {
			return false;
		}
		if (descriptor instanceof RustTrait) {
			return false;
		}

		const fieldNames = Object.keys(descriptor.fields);
		if (fieldNames.length < 1 || fieldNames.length > 3) {
			return false;
		}

		// a wrapper type is not gonna belong to just one singular parent
		// besides, if it did, then replacing the value inside the glossary would break
		// the dependency graph, because the old value of that variable would be used
		// in some nested descriptor trees, but the value inside the glossary would no longer
		// be the same
		if (descriptor.parentType) {
			return false;
		}

		/**
		 * However, because this check might occur before the parent type has been set or discovered,
		 * we're also proactively gonna check if it looks like a parent type
		 * An example of a parent type is LDKPaymentSendFailure_LDKPartialFailure_Body,
		 * so the detection is fairly straightforward: it ends with '_Body' (and potentially
		 * contains at least two `LDK` substrings, though we're not gonna check for that yet)
		 */
		if (descriptor.name.endsWith('_Body')) {
			return false;
		}

		// if there are two types, one of them has to be either an array of an asterisk-based pointer
		let arrayType = null;
		let asteriskPointerType = null;

		for (const [fieldName, currentField] of Object.entries(descriptor.fields)) {
			if (fieldName === '_dummy') {
				// this currently only occurs in LDKError, but fields thus named suggest
				// the whole struct should be discarded from this consideration
				return false;
			}

			let typeToCheck = currentField.type;

			if (currentField.isAsteriskPointer) {
				asteriskPointerType = typeToCheck;
			}

			if (typeToCheck instanceof RustArray) {
				arrayType = typeToCheck;
				typeToCheck = typeToCheck.iteratee;
			}

			if (!(typeToCheck instanceof RustPrimitive)) {
				return false;
			}
		}

		if (fieldNames.length >= 2) {
			if (arrayType === null && asteriskPointerType === null) {
				return false;
			}
		}

		return true;
	}

	private parsePrimitiveWrapper(descriptor: RustStruct): RustPrimitiveWrapper {
		const fieldNames = Object.keys(descriptor.fields);

		const primitiveWrapper = new RustPrimitiveWrapper();
		Object.assign(primitiveWrapper, descriptor);

		if (fieldNames.length === 1) {
			// DANGER: the fields are a dictionary, not an array
			// perhaps this was the wrong design decision
			primitiveWrapper.dataField = primitiveWrapper.fields[fieldNames[0]];
			return primitiveWrapper;
		}

		let isDataFieldArrayLike = false;
		for (const [_, currentField] of Object.entries(descriptor.fields)) {
			if (currentField.type instanceof RustArray) {
				primitiveWrapper.dataField = currentField;
				isDataFieldArrayLike = true;
			} else if (currentField.type instanceof RustPrimitive) {
				if (currentField.type.swiftRawSignature === 'Bool' && currentField.contextualName.includes('is_owned')) {
					primitiveWrapper.ownershipField = currentField;
				} else if (currentField.isAsteriskPointer) {
					primitiveWrapper.dataField = currentField;
					isDataFieldArrayLike = true;
				}
			}
		}

		// now we can do a second pass
		for (const [_, currentField] of Object.entries(descriptor.fields)) {
			if (currentField === primitiveWrapper.dataField) {
				continue;
			}
			if (currentField === primitiveWrapper.lengthField) {
				continue;
			}
			if (currentField === primitiveWrapper.ownershipField) {
				continue;
			}

			// the current field MUST be hitherto unassigned
			if (currentField.type instanceof RustPrimitive) {
				if (primitiveWrapper.dataField && isDataFieldArrayLike) {
					if (currentField.type.swiftRawSignature.includes('Int')) {
						primitiveWrapper.lengthField = currentField;
					}
				} else if (!primitiveWrapper.dataField && !isDataFieldArrayLike) {
					primitiveWrapper.dataField = currentField;
				}
			}
		}
		return primitiveWrapper;
	}

	private containsLambdas(objectLines: ObjectLine[]): boolean {
		for (const currentLine of objectLines) {
			if (LAMBDA_REGEX.test(currentLine.code)) {
				return true;
			}
		}
		return false;
	}

	private parseEnumValue(objectLine: ObjectLine): RustPrimitiveEnumVariant | null {
		const value = new RustPrimitiveEnumVariant();
		value.kind = RustKind.EnumValue;
		value.name = objectLine.code.trim();
		if (value.name.endsWith(',')) {
			// remove trailing comma
			value.name = value.name.substring(0, value.name.length - 1);
		}
		if (value.name.endsWith('_Sentinel')) {
			// no need to expose sentinel values to Swift users
			return null;
		}
		value.documentation = objectLine.comments;
		return value;
	}

	private parseStructField(objectLine: ObjectLine): RustStructField {
		const rustType = this.parseTypeInformation(objectLine.code);
		rustType.documentation = objectLine.comments;

		// to help with inheritance
		const structField = new RustStructField();
		Object.assign(structField, rustType);
		return structField;
	}

	/**
	 * Parse the type and variable name information from a single field line of an object
	 * @param typeLine
	 * @private
	 */
	private parseTypeInformation(typeLine: string): ContextualRustType {
		let rustType = null;

		let relevantTypeLine = typeLine;

		if (relevantTypeLine.endsWith(';')) {
			// remove trailing semicolon
			relevantTypeLine = relevantTypeLine.substring(0, relevantTypeLine.length - 1);
		}

		const mustUseRes = relevantTypeLine.startsWith('MUST_USE_RES ');
		if (mustUseRes) {
			relevantTypeLine = relevantTypeLine.substring('MUST_USE_RES '.length);
		}

		const isConstant = relevantTypeLine.startsWith('const ');
		if (isConstant) {
			relevantTypeLine = relevantTypeLine.substring('const '.length);
		}

		const nonNullablePointer = relevantTypeLine.includes('NONNULL_PTR ');
		if (nonNullablePointer) {
			relevantTypeLine = relevantTypeLine.replace('NONNULL_PTR ', '');
		}

		let typelessLineRemainder: string | null = relevantTypeLine;
		if (relevantTypeLine.startsWith('uint8_t')) {
			rustType = new RustPrimitive();
			typelessLineRemainder = relevantTypeLine.substring('uint8_t'.length).trim();
			if (rustType instanceof RustPrimitive) {
				rustType.cSignature = 'uint8_t';
				rustType.swiftRawSignature = 'UInt8';
				rustType.kind = RustKind.Primitive;
			}
		} else if (relevantTypeLine.startsWith('uintptr_t')) {
			rustType = new RustPrimitive();
			typelessLineRemainder = relevantTypeLine.substring('uintptr_t'.length).trim();
			if (rustType instanceof RustPrimitive) {
				rustType.cSignature = 'uintptr_t';
				rustType.swiftRawSignature = 'UInt';
				rustType.kind = RustKind.Primitive;
			}
		} else if (relevantTypeLine.startsWith('uint16_t')) {
			rustType = new RustPrimitive();
			typelessLineRemainder = relevantTypeLine.substring('uint16_t'.length).trim();
			if (rustType instanceof RustPrimitive) {
				rustType.cSignature = 'uint16_t';
				rustType.swiftRawSignature = 'UInt16';
				rustType.kind = RustKind.Primitive;
			}
		} else if (relevantTypeLine.startsWith('uint32_t')) {
			rustType = new RustPrimitive();
			typelessLineRemainder = relevantTypeLine.substring('uint32_t'.length).trim();
			if (rustType instanceof RustPrimitive) {
				rustType.cSignature = 'uint32_t';
				rustType.swiftRawSignature = 'UInt32';
				rustType.kind = RustKind.Primitive;
			}
		} else if (relevantTypeLine.startsWith('uint64_t')) {
			rustType = new RustPrimitive();
			typelessLineRemainder = relevantTypeLine.substring('uint64_t'.length).trim();
			if (rustType instanceof RustPrimitive) {
				rustType.cSignature = 'uint64_t';
				rustType.swiftRawSignature = 'UInt64';
				rustType.kind = RustKind.Primitive;
			}
		} else if (relevantTypeLine.startsWith('int8_t')) {
			rustType = new RustPrimitive();
			typelessLineRemainder = relevantTypeLine.substring('int8_t'.length).trim();
			if (rustType instanceof RustPrimitive) {
				rustType.cSignature = 'int8_t';
				rustType.swiftRawSignature = 'Int8';
				rustType.kind = RustKind.Primitive;
			}
		} else if (relevantTypeLine.startsWith('intptr_t')) {
			rustType = new RustPrimitive();
			typelessLineRemainder = relevantTypeLine.substring('intptr_t'.length).trim();
			if (rustType instanceof RustPrimitive) {
				rustType.cSignature = 'intptr_t';
				rustType.swiftRawSignature = 'Int';
				rustType.kind = RustKind.Primitive;
			}
		} else if (relevantTypeLine.startsWith('int16_t')) {
			rustType = new RustPrimitive();
			typelessLineRemainder = relevantTypeLine.substring('int16_t'.length).trim();
			if (rustType instanceof RustPrimitive) {
				rustType.cSignature = 'int16_t';
				rustType.swiftRawSignature = 'Int16';
				rustType.kind = RustKind.Primitive;
			}
		} else if (relevantTypeLine.startsWith('int32_t')) {
			rustType = new RustPrimitive();
			typelessLineRemainder = relevantTypeLine.substring('int32_t'.length).trim();
			if (rustType instanceof RustPrimitive) {
				rustType.cSignature = 'int32_t';
				rustType.swiftRawSignature = 'Int32';
				rustType.kind = RustKind.Primitive;
			}
		} else if (relevantTypeLine.startsWith('int64_t')) {
			rustType = new RustPrimitive();
			typelessLineRemainder = relevantTypeLine.substring('int64_t'.length).trim();
			if (rustType instanceof RustPrimitive) {
				rustType.cSignature = 'int64_t';
				rustType.swiftRawSignature = 'Int64';
				rustType.kind = RustKind.Primitive;
			}
		} else if (relevantTypeLine.startsWith('bool')) {
			rustType = new RustPrimitive();
			typelessLineRemainder = relevantTypeLine.substring('bool'.length).trim();
			if (rustType instanceof RustPrimitive) {
				rustType.cSignature = 'bool';
				rustType.swiftRawSignature = 'Bool';
				rustType.kind = RustKind.Primitive;
			}
		} else if (relevantTypeLine.startsWith('void')) {
			rustType = new RustPrimitive();
			typelessLineRemainder = relevantTypeLine.substring('void'.length).trim();
			if (rustType instanceof RustPrimitive) {
				rustType.cSignature = 'void';
				rustType.swiftRawSignature = 'Void';
				rustType.kind = RustKind.Primitive;
			}
		} else {
			let unprefixedTypeLine = relevantTypeLine;

			// TODO: figure out why these prefixes sometimes exist
			if (relevantTypeLine.startsWith('struct ')) {
				unprefixedTypeLine = relevantTypeLine.substring('struct '.length).trim();
			} else if (relevantTypeLine.startsWith('enum ')) {
				unprefixedTypeLine = relevantTypeLine.substring('enum '.length).trim();
			} else if (relevantTypeLine.startsWith('union ')) {
				unprefixedTypeLine = relevantTypeLine.substring('union '.length).trim();
			}

			const components = unprefixedTypeLine.split(' ');
			if (components.length >= 1) {
				const typeName = components[0];
				let variableName = null;

				if (components.length === 2) {
					variableName = components[1];
				} else if (components.length > 2) {
					console.error('Excessive type component count:\n>', typeLine);
					process.exit(1);
				}

				if (typeName in this.typeGlossary) {
					rustType = this.typeGlossary[typeName];
					typelessLineRemainder = variableName;
				} else if (typeName.startsWith('LDKnative') && variableName && variableName.endsWith('inner')) {
					rustType = new OpaqueRustStruct();
					rustType.name = typeName;
					this.typeGlossary[typeName] = rustType;
					typelessLineRemainder = variableName;
					debug('Opaque type detected: `%s` (`%s`)', typeName, typelessLineRemainder);
				} else {
					console.error(`Unknown non-primitive type: ${typeName}\n>`, typeLine);
					process.exit(1);
				}
			}
		}
		// continue for other types

		let isAsteriskPointer = false;
		if (typelessLineRemainder && typelessLineRemainder.startsWith('*')) {
			typelessLineRemainder = typelessLineRemainder.substring('*'.length).trim();
			if (isConstant) {
				// duplicate constant declaration. Find out why this is necessary
			} else {
				// singular constant declaration. Find out why this is necessary
			}
			isAsteriskPointer = true;
		} else if (typelessLineRemainder && typelessLineRemainder.startsWith('(*')) {
			const matches = ARRAY_POINTER_REGEX.exec(typelessLineRemainder);
			if (Array.isArray(matches)) {
				if (!rustType) {
					console.error('Empty array pointer iteratee type:\n>', typeLine);
					process.exit(1);
				}

				isAsteriskPointer = true;
				const name = matches[1];
				const length = parseInt(matches[2]);
				const actualType = new RustArray();
				actualType.iteratee = rustType;
				actualType.length = length;
				actualType.kind = RustKind.Array;

				if (!(rustType instanceof RustPrimitive)) {
					debug('Non-primitive fixed-length-array pointer: %s\n> %s', rustType.typeDescription, typeLine);
				}

				rustType = actualType;
				typelessLineRemainder = name;
			}
			// this is likely an array
		}

		let contextualName = typelessLineRemainder;

		const FIXED_LENGTH_ARRAY_REGEX = /[a-zA-Z0-9_]+ ([a-zA-Z0-9_]+)\[([1-9][0-9]*)\]/;
		const arrayMatch = FIXED_LENGTH_ARRAY_REGEX.exec(relevantTypeLine);
		if (arrayMatch && arrayMatch.length > 0) {
			if (!rustType) {
				console.error('Empty array pointer iteratee type:\n>', typeLine);
				process.exit(1);
			}
			const name = arrayMatch[1];
			const length = parseInt(arrayMatch[2]);
			const actualType = new RustArray();
			actualType.iteratee = rustType;
			actualType.length = length;
			actualType.kind = RustKind.Array;

			if (!(rustType instanceof RustPrimitive)) {
				debug('Non-primitive fixed-length-array: %s\n> %s', rustType.typeDescription, typeLine);
			}

			rustType = actualType;
			contextualName = name;
		} else if (!rustType) {
			console.error('Unknown type information:\n>', typeLine);
			process.exit(1);
		}

		const returnedType = new ContextualRustType();
		returnedType.type = rustType;
		returnedType.contextualName = contextualName;
		returnedType.isConstant = isConstant;
		returnedType.isNonnullablePointer = nonNullablePointer;
		returnedType.isAsteriskPointer = isAsteriskPointer;
		returnedType.mustUseResult = mustUseRes;
		return returnedType;
	}

	private parseLambda(objectLine: ObjectLine): RustLambda {
		const matches = LAMBDA_REGEX.exec(objectLine.code);

		if (!Array.isArray(matches)) {
			console.error('Failed to parse lambda:\n>', objectLine.code);
			process.exit(1);
		}

		const returnType = matches[2];
		const name = matches[3];

		const thisArgLine = matches[4];
		const hasThisArg = !!thisArgLine;

		const argumentLine = matches[6];
		const argumentStrings = argumentLine.split(', ');

		const lambda = new RustLambda();
		lambda.name = name;
		lambda.documentation = objectLine.comments;

		const returnValue = this.parseTypeInformation(returnType.trim());
		const typedReturnValue = new RustFunctionReturnValue();
		Object.assign(typedReturnValue, returnValue);

		lambda.returnValue = typedReturnValue;
		lambda.returnValue.isReturnValue = true;

		if (hasThisArg) {
			const thisArgument = this.parseTypeInformation(thisArgLine);

			const thisArgumentTyped = new RustFunctionArgument();
			Object.assign(thisArgumentTyped, thisArgument);

			lambda.thisArgument = thisArgumentTyped;
			lambda.arguments.push(thisArgumentTyped);
		} else {
			// TODO: figure out a way to parse nameless lambda arguments
			// disregard all the other arguments; this lambda won't be initialized anyway
			// headache-causing example:
			// void (*set_pubkeys)(const struct LDKBaseSign*NONNULL_PTR );
			// where's the argument name?! This is unparseable
			return lambda;
		}

		for (let currentArgumentLine of argumentStrings) {
			currentArgumentLine = currentArgumentLine.trim();
			if (currentArgumentLine.length < 1) {
				continue;
			}
			const currentArgument = this.parseTypeInformation(currentArgumentLine);

			// this doesn't really do much except help with instanceof calls
			const currentArgumentTyped = new RustFunctionArgument();
			Object.assign(currentArgumentTyped, currentArgument);
			lambda.arguments.push(currentArgumentTyped);
		}

		return lambda;
	}

	/**
	 *
	 * @param methodLine
	 * @param docComment
	 * @private
	 */
	private parseMethod(methodLine: string, docComment: string) {
		const matches = FUNCTION_REGEX.exec(methodLine);
		if (!Array.isArray(matches)) {
			console.error('Failed to parse method:\n>', methodLine);
			process.exit(1);
		}

		let returnType = matches[1];
		let name = matches[3];
		let argumentLine = matches[4];

		let arrayPointerMatches = ARRAY_POINTER_REGEX.exec(matches[2]);
		if (Array.isArray(arrayPointerMatches)) {
			// bellwether line:
			// const uint8_t (*OutPoint_get_txid(const struct LDKOutPoint *NONNULL_PTR this_ptr))[32];
			// the difficulty about this particular method is that it returns a pointer to a primitive
			// of finite length
			// additionally, it was not supported by the original regex
			let artificialRegexInput = returnType + arrayPointerMatches[1] + ';';
			const artificialMatches = STRICT_FUNCTION_REGEX.exec(artificialRegexInput);
			if(!Array.isArray(artificialMatches)){
				console.error('Failed to parse const pointer returning method:\n>', methodLine);
				process.exit(1);
			}
			name = artificialMatches[2];
			argumentLine = artificialMatches[3];
			returnType = `${returnType}(*${name})[${arrayPointerMatches[2]}]`
		}

		const argumentStrings = argumentLine.split(', ');

		const method = new RustFunction();

		const returnValue = this.parseTypeInformation(returnType.trim());
		const typedReturnValue = new RustFunctionReturnValue();
		Object.assign(typedReturnValue, returnValue);

		method.returnValue = typedReturnValue;
		method.returnValue.isReturnValue = true;
		method.name = name;
		method.documentation = docComment;

		if (argumentLine !== 'void') {
			for (let currentArgumentLine of argumentStrings) {
				currentArgumentLine = currentArgumentLine.trim();
				if (currentArgumentLine.length < 1) {
					continue;
				}
				const currentArgument = this.parseTypeInformation(currentArgumentLine.trim());

				const typedArgument = new RustFunctionArgument();
				Object.assign(typedArgument, currentArgument);
				method.arguments.push(typedArgument);
			}
		}

		/**
		 * If a method has a name like CVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ_free
		 * Then the object it belongs to is CVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ
		 * Finding that object name is a matter of finding the first entry of the method
		 * following an underscore that is lowercase.
		 *
		 * Another nasty example is CResult__u832APIErrorZ_ok
		 * There, too, we find CResult__u832APIErrorZ as the prefix because the first underscore
		 * is not followed by a lowercase letter, but rather by another underscore.
		 *
		 * However, even that rule may sometimes have an exception, such as here:
		 * C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ_clone
		 * The exception being that if an underscore is followed by a u16/u32 (u with numbers),
		 * it's acceptable.
		 *
		 * Additionally, CResult_boolPeerHandleErrorZ_ok is also valid.
		 *
		 */

		const METHOD_TYPE_ASSOCIATION_PREFIX_REGEX = /^([A-Z][a-zA-Z0-9]*)(_([A-Z_][a-zA-Z0-9]*))*(_(i5|i8|i16|i32|i64|i128|u5|u8|u16|u32|u64|u128|usize|bool)[a-zA-Z0-9]+)?/;
		const prefixMatches = METHOD_TYPE_ASSOCIATION_PREFIX_REGEX.exec(name);
		if (!prefixMatches) {
			// debug('object-unassociated method name: %s', name);
			this.floatingFunctions.push(method);
			return;
		}

		const namePrefix = prefixMatches[0];
		for (const [typeName, currentType] of Object.entries(this.typeGlossary)) {
			if (typeName.startsWith(`LDK${namePrefix}`) && typeName.endsWith(namePrefix)) {
				// debug('Method association: %s -> %s', name, typeName);

				// this is purely for curiosity
				let typeKind = currentType.constructor.name;
				this.kindsWithMethodAssociations.add(typeKind);

				const methodsArray = currentType['methods'];
				if (!Array.isArray(methodsArray)) {
					console.error(`Type ${typeName} of kind ${typeKind} is missing a methods property for ${name}!\n>`, methodLine);
					process.exit(1);
				}

				methodsArray.push(method);
				return;
			}
		}

		console.error(`Method ${name} cannot finds its associated type!\n>`, methodLine);
		process.exit(1);
	}

}

interface ObjectLine {
	comments: string,
	code: string
}
