//
//  Bundle.swift
//  iDine
//
//  Created by Alejandro Sanabria on 6/02/23.
//

import Foundation

extension Bundle {
    
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T? {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            return nil
        }
        
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(type, from: data) else {
            return nil
        }
        
        return loaded
    }
}
