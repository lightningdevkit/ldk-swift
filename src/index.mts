import Parser from './parser.mjs';
import Config from './config.mjs';
import Generator from './generation/index.mjs';

(async () => {
	// add comments
	let config = new Config();

	const parser = new Parser(config);
	parser.parse();

	console.dir(Object.keys(parser.glossary).filter(s => s.startsWith('LDKCOption_')));
	console.dir(parser.glossary['LDKCOption_U128Z']);
	if(1 < 2) {
		process.exit(1);
	}

	const generator = new Generator(parser);

	// optional, only if we wanna remove existing artifacts
	generator.initializeOutputDirectory();

	const serializationHashTree = generator.calculateSerializationHash();

	await generator.generateTypes();
	await generator.generateFunctions();
	await generator.runFormatter();
})();

interface NullTest {
	someValue?: string
}

function nullInterpolationExample(someValue: NullTest){
	console.log(`hello, ${someValue.someValue}`)
}
