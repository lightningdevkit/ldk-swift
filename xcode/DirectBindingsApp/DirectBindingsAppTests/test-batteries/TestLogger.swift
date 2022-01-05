//
//  MyLogger.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/17/21.
//

class TestLogger: Logger {

    override func log(record: Record) {
        print("some abstract log thing")
    }

}
