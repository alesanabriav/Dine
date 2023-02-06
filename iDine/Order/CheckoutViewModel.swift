//
//  CheckoutViewModel.swift
//  iDine
//
//  Created by Alejandro Sanabria on 6/02/23.
//

import SwiftUI

class CheckoutViewModel : ObservableObject {
    let paymentTypes: [String] = ["Cash", "Credit Card", "Points"]
    let tipAmounts: [Int] = [10, 15, 20, 25, 0]
    @EnvironmentObject var order: Order
    @Published var paymentType: String = "Cash"
    @Published var showLoyalty: Bool = false
    @Published var loyaltyNum: String = ""
    @Published var tipAmount: Int = 10
    @Published var totalAmount: String = ""
    @Published var showPaymentAlert: Bool = false
    
    func togglePaymentAlert() {
        showPaymentAlert = !self.showPaymentAlert
    }
}
