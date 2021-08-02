//
//  MyLogger.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/17/21.
//

import LDKSwift
import LDKHeaders

class TestLogger: Logger {

    override func log(record: String?) {
        print("record: \(record)")
    }

}
