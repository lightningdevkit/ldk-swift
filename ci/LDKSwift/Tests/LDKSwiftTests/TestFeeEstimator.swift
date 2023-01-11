//
//  MyFeeEstimator.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/17/21.
//

#if SWIFT_PACKAGE
import LDKSwift
import LDKHeaders
#endif

class TestFeeEstimator: FeeEstimator {

    override func getEstSatPer_1000Weight(confirmationTarget: Bindings.ConfirmationTarget) -> UInt32 {
        return 253
    }

}
