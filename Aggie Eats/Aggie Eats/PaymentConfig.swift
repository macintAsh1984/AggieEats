//
//  PaymentConfig.swift
//  Aggie Eats
//
//  Created by Ashley Valdez on 12/17/24.
//

import Foundation

class PaymentConfig {
    
    var paymentIntentClientSecret: String?
    static var shared: PaymentConfig = PaymentConfig()
    
    private init() { }
}
