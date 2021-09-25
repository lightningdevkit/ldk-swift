//
//  MyKeysInterface.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/18/21.
//

class TestKeysInterface: KeysInterface {
    override func get_node_secret() -> [UInt8] {
        return [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]
    }
}
