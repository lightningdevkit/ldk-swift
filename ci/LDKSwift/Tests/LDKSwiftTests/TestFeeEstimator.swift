//
//  MyFeeEstimator.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/17/21.
//

#if os(Linux)
import LDKSwift
import LDKHeaders
#endif

class TestFeeEstimator: FeeEstimator {

    override func get_est_sat_per_1000_weight(confirmation_target: LDKConfirmationTarget) -> UInt32 {
        return 253
    }

}
