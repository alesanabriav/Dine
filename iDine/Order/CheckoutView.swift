//
//  CheckoutView.swift
//  iDine
//
//  Created by Alejandro Sanabria on 6/02/23.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var viewModel: CheckoutViewModel
    
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
            
            Section("Total: 100%") {
                Button("Confirm order") {
                    
                }
            }
        }
        .navigationTitle("Payment")
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(viewModel: CheckoutViewModel())
            .environmentObject(Order())
    }
}
