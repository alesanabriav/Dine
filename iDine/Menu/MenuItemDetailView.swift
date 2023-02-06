//
//  MenuItemDetailView.swift
//  iDine
//
//  Created by Alejandro Sanabria on 6/02/23.
//

import SwiftUI

struct MenuItemDetailView: View {
    let item: MenuItem
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                
                Text(item.photoCredit)
                    .font(.caption)
                    .padding(4)
                    .background(.black)
                    .foregroundColor(.white)
                    .offset(x: -16, y: -4)
            }
            
            Text(item.description)
                .padding(16)
            
            Button("Order this") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MenuItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemDetailView(item: MenuItem.example)
            .environmentObject(Order())
    }
}
