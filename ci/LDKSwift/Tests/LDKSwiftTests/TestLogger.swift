//
//  MyLogger.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/17/21.
//

#if os(Linux)
import LDKSwift
import LDKHeaders
#endif

class TestLogger: Logger {

    override func log(record: Record) {
		print("\nRLTestLogger (\(record.get_level())): \(record.get_file()):\(record.get_line()):\n> \(record.get_args())\n")
	}

}

class MuteLogger: Logger {

    override func log(record: Record) {
		// do nothing
	}

}
