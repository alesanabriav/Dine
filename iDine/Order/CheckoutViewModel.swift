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
    
    @Published var paymentType: String = "Cash"
    @Published var showLoyalty: Bool = false
    @Published var loyaltyNum: String = ""
    @Published var tipAmount = 10
}
