//
//  iDineApp.swift
//  iDine
//
//  Created by Alejandro Sanabria on 6/02/23.
//

import SwiftUI

@main
struct iDineApp: App {
    
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
