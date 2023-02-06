//
//  MenuItemView.swift
//  iDine
//
//  Created by Alejandro Sanabria on 6/02/23.
//

import SwiftUI

struct MenuItemView: View {
    let item: MenuItem
    let viewModel: MenuViewModel
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(.black, lineWidth: 2))
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }
            Spacer()
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(viewModel.colors[restriction])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        MenuItemView(item: MenuItem.example, viewModel: MenuViewModel())
    }
}
