//
//  OrderCompletion.swift
//  Aggie Eats
//
//  Created by Ashley Valdez on 12/17/24.
//

import SwiftUI
import Stripe

struct OrderCompletion: View {
    @State var paymentMethodParams: STPPaymentMethodParams?
    
    var body: some View {
        VStack {
            Section {
                // Stripe Credit Card TextField Here
                STPPaymentCardTextField.Representable.init(paymentMethodParams: $paymentMethodParams)
            } header: {
                Text("Payment Information")
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    OrderCompletion()
}
