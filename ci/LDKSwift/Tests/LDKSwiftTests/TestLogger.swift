//
//  MyLogger.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/17/21.
//

#if SWIFT_PACKAGE
import LDKSwift
import LDKHeaders
#endif

class TestLogger: Logger {

    override func log(record: Record) {
		print("\nRLTestLogger (\(record.getLevel())): \(record.getFile()):\(record.getLine()):\n> \(record.getArgs())\n")
	}

}

class MuteLogger: Logger {

    override func log(record: Record) {
		// do nothing
	}

}
