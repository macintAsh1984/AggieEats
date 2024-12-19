//
//  OrderingView.swift
//  Aggie Eats
//
//  Created by Ashley Valdez on 11/30/24.
//

import SwiftUI

struct OrderingView: View {
    @State var quantity: Int = 0
    @State var quantityStr: String = String()
    @State var amount: Decimal = 0.00
    @State var navigateToOrderCompletion: Bool = false
    @FocusState var isAmountFocused: Bool
    
    
    func startOrder (completion: @escaping (String?) -> Void) {
        guard let url = URL(string: "https://natural-inquisitive-comic.glitch.me/create-payment-intent") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(amount)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
                        
            guard let data = data, error == nil,
                  (response as? HTTPURLResponse)?.statusCode == 200
            else {
                completion(nil)
                return
            }
            
            let checkoutIntentResponse = try? JSONDecoder().decode(CheckoutIntentResponse.self, from: data)
            completion(checkoutIntentResponse?.clientSecret)

        }.resume()
        
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Order")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom)
                EnterQuantityView(quantity: $quantity, quantityStr: $quantityStr)
                EnterAmountView(amount: $amount, isAmountFocused: $isAmountFocused)
                Divider()
                    .frame(height: 3)
                    .overlay(.black)
                    .padding([.top, .bottom])
                TotalView(total: $amount)
                    .padding(.bottom)
                Button {
                    startOrder { clientSecret in
                        PaymentConfig.shared.paymentIntentClientSecret = clientSecret
                    }
                    navigateToOrderCompletion = true
                } label: {
                    Text("Start Order")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                .controlSize(.large)
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarBackButtonHidden()
            .toolbar(.hidden, for: .tabBar)
            .onAppear {
                quantityStr = String(quantity)
            }
            .onChange(of: quantity) {
                quantityStr = String(quantity)
            }
            .onTapGesture {
                isAmountFocused = false
                
            }
            .navigationDestination(isPresented: $navigateToOrderCompletion) {
                OrderCompletion(total: $amount)
            }
        } //end of nav stack
    }
    
}

struct EnterQuantityView: View {
    @Binding var quantity: Int
    @Binding var quantityStr: String
    
    var body: some View {
        HStack {
            Text("Quantity")
                .font(.title2)
                .fontWeight(.bold)
                Spacer()
            Stepper("", value: $quantity, in: 0...3)
            TextField("", text: $quantityStr)
                .disabled(true)
                .multilineTextAlignment(.center)
                .cornerRadius(10)
                .frame(width: 100, height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue, lineWidth: 1)
                )
        }
    }
}

struct EnterAmountView : View {
    @Binding var amount: Decimal
    @FocusState.Binding var isAmountFocused: Bool
    
    var body : some View {
        HStack {
            Text("Pay What You Want")
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
            TextField("", value: $amount, format: .currency(code: "USD"))
                .focused($isAmountFocused)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.center)
                .cornerRadius(10)
                .frame(width: 100, height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue, lineWidth: 1)
                )
        }
        .padding(.bottom)
    }
}

struct TotalView: View {
    @Binding var total: Decimal
    
    var body: some View {
        HStack {
            Text("Total")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            Text(total, format: .currency(code: "USD"))
                .font(.title)
                .fontWeight(.bold)
        }
    }
}


#Preview {
    OrderingView()
}
