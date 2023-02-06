//
//  ContentView.swift
//  iDine
//
//  Created by Alejandro Sanabria on 6/02/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = MenuViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.menuSections) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            NavigationLink {
                                MenuItemDetailView(item: item)
                            } label: {
                                MenuItemView(item: item, viewModel: viewModel)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(.grouped)
        }
        .onAppear {
            viewModel.getSections()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
