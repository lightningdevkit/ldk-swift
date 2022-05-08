//
//  MyLogger.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/17/21.
//

class TestLogger: Logger {

    override func log(record: Record) {
        Bindings.print("\nRLTestLogger (\(record.get_level())): \(record.get_file()):\(record.get_line()):\n> \(record.get_args())\n")
    }

}
