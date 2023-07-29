import Parser from '../parser.mjs';
import {
	RustFunction,
	RustNullableOption,
	RustPrimitiveEnum,
	RustPrimitiveWrapper,
	RustResult,
	RustStruct,
	RustTaggedValueEnum,
	RustTrait,
	RustTuple,
	RustVector
} from '../rust_types.mjs';
import * as fs from 'fs';
import * as path from 'path';
import * as child_process from 'child_process';
import * as crypto from 'crypto';
import url from 'url';

export default class Generator {
	private parser: Parser;
	private auxiliaryArtifacts: AuxiliaryArtifacts;

	constructor(parser: Parser) {
		this.parser = parser;
		this.auxiliaryArtifacts = new AuxiliaryArtifacts();
	}

	static snakeCaseToCamelCase(input: string, capitalizeFirst: boolean = false): string {
		let output = input.replace(/([_][a-zA-Z0-9])/g, group =>
			group
				.toUpperCase()
				.replace('_', '')
		);
		if (capitalizeFirst) {
			output = output.charAt(0).toUpperCase() + output.substring(1);
		} else {
			output = output.charAt(0).toLowerCase() + output.substring(1);
		}
		return output;
	}

	/**
	 * Gets the indentation depth of the first line that contains non-whitespace characters
	 * @param input
	 */
	static firstIndentationDepth(input: string): number {
		const regex = /^(\t*)[\S]/m;
		const matches = regex.exec(input);
		if (Array.isArray(matches)) {
			return matches[1].length;
		}
		return 0;
	}

	static reindentCode(input: string, newDepth: number) {
		const oldDepth = Generator.firstIndentationDepth(input);
		const searchString = new RegExp(`^\t{${oldDepth}}`, 'gm');
		return input.replaceAll(searchString, '\t'.repeat(newDepth));
	}

	/**
	 * Make sure the directory exists, and remove its contents if it's not empty.
	 * This will not remove symbolic links.
	 */
	initializeOutputDirectory() {
		const outputDirectory = this.parser.config.getOutputBaseDirectoryPath();
		const contents = fs.readdirSync(outputDirectory);
		for (const currentPathComponentName of contents) {
			const currentPath = path.join(outputDirectory, currentPathComponentName);
			const stat = fs.statSync(currentPath);
			if (stat.isDirectory()) {
				fs.rmSync(currentPath, {recursive: true});
				continue;
			}
			if (!stat.isFile()) {
				continue;
			}
			if (!currentPath.endsWith('.swift')) {
				continue;
			}
			fs.rmSync(currentPath);
		}
	}

	async generateTypes() {
		const {default: StructGenerator} = await import('./struct_generator.mjs');
		const {default: VectorGenerator} = await import('./vector_generator.mjs');
		const {default: ComplexEnumGenerator} = await import('./complex_enum_generator.mjs');
		const {default: PrimitiveEnumGenerator} = await import('./primitive_enum_generator.mjs');
		const {default: PrimitiveWrapperGenerator} = await import('./primitive_wrapper_generator.mjs');
		const {default: ResultGenerator} = await import('./result_generator.mjs');
		const {default: NullableOptionGenerator} = await import('./nullable_option_generator.mjs');
		const {default: TraitGenerator} = await import('./trait_generator.mjs');
		const {default: TupleGenerator} = await import('./tuple_generator.mjs');

		const glossary = this.parser.glossary;
		const config = this.parser.config;

		const structGenerator = new StructGenerator(config, this.auxiliaryArtifacts);
		const wrapperGenerator = new PrimitiveWrapperGenerator(config, this.auxiliaryArtifacts);
		const vectorGenerator = new VectorGenerator(config, this.auxiliaryArtifacts);
		const primitiveEnumGenerator = new PrimitiveEnumGenerator(config, this.auxiliaryArtifacts);
		const complexEnumGenerator = new ComplexEnumGenerator(config, this.auxiliaryArtifacts);
		const nullableOptionGenerator = new NullableOptionGenerator(config, this.auxiliaryArtifacts);
		const resultGenerator = new ResultGenerator(config, this.auxiliaryArtifacts);
		const tupleGenerator = new TupleGenerator(config, this.auxiliaryArtifacts);
		const traitGenerator = new TraitGenerator(config, this.auxiliaryArtifacts);

		for (const [_, currentType] of Object.entries(glossary)) {
			if (currentType.parentType) {
				continue;
			}

			if (currentType instanceof RustTrait) {
				traitGenerator.generate(currentType);
			} else if (currentType instanceof RustPrimitiveWrapper) {
				wrapperGenerator.generate(currentType);
			} else if (currentType instanceof RustVector) {
				vectorGenerator.generate(currentType);
			} else if (currentType instanceof RustPrimitiveEnum) {
				primitiveEnumGenerator.generate(currentType);
			} else if (currentType instanceof RustNullableOption) {
				nullableOptionGenerator.generate(currentType);
			} else if (currentType instanceof RustTaggedValueEnum) {
				complexEnumGenerator.generate(currentType);
			} else if (currentType instanceof RustResult) {
				resultGenerator.generate(currentType);
			} else if (currentType instanceof RustTuple) {
				tupleGenerator.generate(currentType);
			} else if (currentType instanceof RustStruct) {
				structGenerator.generate(currentType);
			}
		}
	}

	public calculateSerializationHash() {
		const hashTree = this.generateSerializationHashTree();
		const serialization = JSON.stringify(hashTree);
		const hash = crypto.createHash('sha256').update(serialization).digest('hex');
		return hash;
	}

	async generateFunctions() {
		const {default: BindingsFileGenerator, GlobalBindingsStruct} = await import('./bindings_file_generator.mjs');
		const bindingsStruct = new GlobalBindingsStruct();
		bindingsStruct.methods = this.parser.functions;

		const bindingsFileGenerator = new BindingsFileGenerator(this.parser.config, this.auxiliaryArtifacts);
		bindingsFileGenerator.generate(bindingsStruct);

		if (!this.parser.config.getSwiftFormatterBinaryPath()) {
			this.generateVersionFile();
		}
	}

	async runFormatter() {
		const configFilePath = url.fileURLToPath(new URL('.', import.meta.url)) + '../../.swift-format';
		const outputDirectory = this.parser.config.getOutputBaseDirectoryPath();
		const swiftFormatterBinary = this.parser.config.getSwiftFormatterBinaryPath();
		if (!swiftFormatterBinary) {
			return;
		}

		try {
			const command = `${swiftFormatterBinary} --configuration ${configFilePath} --recursive --in-place ./ `;
			console.log(command);
			child_process.execSync(command, {
				cwd: outputDirectory
			}).toString('utf-8');
		} catch (e) {
			const errorOutput = e.stderr.toString('utf-8').trim();
			console.error('Failed to format Swift output:', errorOutput);
			throw new Error(errorOutput)
		}

		// after all is generated and formatted, we generate the version file
		this.generateVersionFile();

		const versionOutputPath = path.join(this.parser.config.getOutputBaseDirectoryPath(), 'VersionDescriptor.swift');

		try {
			const command = `${swiftFormatterBinary} --configuration ${configFilePath} --in-place ${versionOutputPath}`;
			console.log(command);
			child_process.execSync(command).toString('utf-8');
		} catch (e) {
			const errorOutput = e.stderr.toString('utf-8').trim();
			console.error('Failed to format Swift output:', errorOutput);
			throw new Error(errorOutput)
		}
	}

	private generateVersionFile() {

		const serializationHash = this.calculateSerializationHash();
		const gitDirtyTagDescription = child_process.execSync('git describe --tag --dirty --always').toString('utf-8')
			.trim();
		const gitCommitHash = child_process.execSync('git rev-parse HEAD').toString('utf-8').trim();

		const versionFileContents = `
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			extension Bindings {
				public class func getLDKSwiftBindingsSerializationHash() -> String {
					return "${serializationHash}"
				}
				public class func getLDKSwiftBindingsVersion() -> String {
					return "${gitDirtyTagDescription}"
				}
				public class func getLDKSwiftBindingsCommitHash() -> String {
					return "${gitCommitHash}"
				}
			}
		`;

		const outputPath = path.join(this.parser.config.getOutputBaseDirectoryPath(), 'VersionDescriptor.swift');
		fs.writeFileSync(outputPath, versionFileContents);
	}

	private generateSerializationHashTree(directoryPath = this.parser.config.getOutputBaseDirectoryPath()): object[] {
		const contents = fs.readdirSync(directoryPath);
		const childDirectories = [];
		const childSwiftFiles = [];
		for (const currentPathComponentName of contents) {
			const currentPath = path.join(directoryPath, currentPathComponentName);
			const stat = fs.statSync(currentPath);
			if (stat.isDirectory()) {
				childDirectories.push(currentPathComponentName);
			}
			if (!stat.isFile()) {
				continue;
			}
			if (!currentPath.endsWith('.swift')) {
				continue;
			}
			if (currentPathComponentName === 'VersionDescriptor.swift') {
				// do not incorporate the version descriptor file into the hash preimage
				continue;
			}
			childSwiftFiles.push(currentPathComponentName);
		}
		const tree = [];

		// make sure the directory and file names are sorted to make the hash deterministic
		childDirectories.sort();
		childSwiftFiles.sort();

		for (const currentDirectoryName of childDirectories) {
			const currentPath = path.join(directoryPath, currentDirectoryName);
			tree.push([currentDirectoryName, this.generateSerializationHashTree(currentPath)]);
		}

		const whitespaceRegex = /\s+/gm;

		const hasFormatter = !!this.parser.config.getSwiftFormatterBinaryPath();

		for (const currentSwiftFileName of childSwiftFiles) {
			const currentPath = path.join(directoryPath, currentSwiftFileName);
			const fileContents = fs.readFileSync(currentPath).toString('utf-8');

			if (hasFormatter) {
				// now that we have deterministic formatters, artificial canonicalization is unnecessary
				const hash = crypto.createHash('sha256').update(fileContents).digest('hex');
				tree.push([currentSwiftFileName, hash]);
			} else {
				// remove all leading trailing whitespaces from every line, as well as any repetition of new lines
				const canonicalFileContents = fileContents
					.replaceAll(/^\s*/mg, '') // leading spaces
					.replaceAll(/\s*$/mg, '') // trailing spaces
					.replaceAll(/\n+/g, '\n') // multiple newlines
					.replaceAll(/\s*\/\/.*/g, '') // comment lines
					.replaceAll(/;+$/g, ''); // trailing semicolons
				// remove all whitespace so it produces the same output regardless of whether it got linted
				// const dewhitespacedContents = fileContents.replaceAll(whitespaceRegex, '');
				const hash = crypto.createHash('sha256').update(canonicalFileContents).digest('hex');
				tree.push([currentSwiftFileName, hash]);
			}

		}
		return tree;
	}
}

export class AuxiliaryArtifacts {

	private _elidedTypeMethods: { method: RustFunction, swiftName: string } [] = [];

	private _tuples: { [swiftRawType: string]: Set<number> } = {};

	get tuples() {
		return this._tuples;
	}

	get methods() {
		return this._elidedTypeMethods;
	}

	public addTuple(swiftTypeName: string, size: number) {
		if (!this._tuples[swiftTypeName]) {
			this._tuples[swiftTypeName] = new Set<number>();
		}

		this._tuples[swiftTypeName].add(size);
	}

	public addMethod(method: RustFunction, newName: string) {
		this._elidedTypeMethods.push({method: method, swiftName: newName});
	}

}
