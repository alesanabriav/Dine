//
//  MenuViewModel.swift
//  iDine
//
//  Created by Alejandro Sanabria on 6/02/23.
//

import SwiftUI

class MenuViewModel : ObservableObject {
    
    @Published var menuSections: [MenuSection] = [MenuSection]()
    
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
    func getSections() {
        
        guard let models = Bundle.main.decode([MenuSection].self, from: "menu.json") else {
            return
        }
        
        self.menuSections = models
    }
    
}
