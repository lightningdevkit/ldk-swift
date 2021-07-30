//
//  MyLogger.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/17/21.
//

import Foundation
import LDKSwift

class MyLogger: Logger {
    
    override func log(record: String?) {
        print("record: \(record)")
    }
    
}
