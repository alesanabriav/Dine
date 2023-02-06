//
//  CheckoutView.swift
//  iDine
//
//  Created by Alejandro Sanabria on 6/02/23.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @ObservedObject var viewModel: CheckoutViewModel
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(viewModel.tipAmount)
        
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $viewModel.paymentType) {
                    ForEach(viewModel.paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                Toggle("Add Loyalty", isOn: $viewModel.showLoyalty)
                
                if viewModel.showLoyalty {
                    TextField("Enter your Loyalty id", text: $viewModel.loyaltyNum)
                }
            }
            
            Section("Add a Tip") {
                Picker("Percentage", selection: $viewModel.tipAmount) {
                    ForEach(viewModel.tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Total: \(totalPrice)") {
                Button("Confirm order") {
                    viewModel.togglePaymentAlert()
                }
            }
        }
        .navigationTitle("Payment")
        .alert("Order confirmed", isPresented: $viewModel.showPaymentAlert) {
            
        } message: {
            Text("Your total was \(totalPrice)")
        }
    
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(viewModel: CheckoutViewModel())
            .environmentObject(Order())
    }
}
