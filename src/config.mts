import {default as debugModule} from 'debug';
import url from 'url';

const debug = debugModule('ldk-parser:config');

export default class Config {

	getHeaderPath(): string {
		if (typeof process.env['LDK_SWIFT_GENERATOR_INPUT_HEADER_PATH'] === 'string' && process.env['LDK_SWIFT_GENERATOR_INPUT_HEADER_PATH'].length > 0) {
			debug('Header path: $LDK_SWIFT_GENERATOR_INPUT_HEADER_PATH = "%s"', process.env['LDK_SWIFT_GENERATOR_INPUT_HEADER_PATH']);
			return process.env['LDK_SWIFT_GENERATOR_INPUT_HEADER_PATH'];
		}

		const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
		const headerPath = `${__dirname}/../../ldk-c-bindings/lightning-c-bindings/include/lightning.h`;
		debug('Header path: "%s"', headerPath);
		return headerPath;
	}

	getOutputBaseDirectoryPath(): string {
		if (typeof process.env['LDK_SWIFT_GENERATOR_OUTPUT_DIRECTORY_PATH'] === 'string' && process.env['LDK_SWIFT_GENERATOR_OUTPUT_DIRECTORY_PATH'].length > 0) {
			debug('Output directory path: $LDK_SWIFT_GENERATOR_OUTPUT_DIRECTORY_PATH = "%s"', process.env['LDK_SWIFT_GENERATOR_OUTPUT_DIRECTORY_PATH']);
			return process.env['LDK_SWIFT_GENERATOR_OUTPUT_DIRECTORY_PATH'];
		}

		const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
		const outputDirectoryPath = `${__dirname}/../out`;
		debug('Output directory path: "%s"', outputDirectoryPath);
		return outputDirectoryPath;
	}
}
