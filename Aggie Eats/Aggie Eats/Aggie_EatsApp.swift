//
//  Aggie_EatsApp.swift
//  Aggie Eats
//
//  Created by Ashley Valdez on 11/28/24.
//

import SwiftUI
import Stripe

@main
struct Aggie_EatsApp: App {
    init() {
        StripeAPI.defaultPublishableKey = "pk_test_51QX5ILHUrE9FgvEhrPlWiY1pkLIKT84xrKxc8XSw5TTo7ifiGGkuUoIz7etHnLh75k08VGyB5IIlyTGMR2YlL4ep00qieijMGC"
    }
    
    var body: some Scene {
        WindowGroup {
            BottomPageNav()
        }
    }
}
