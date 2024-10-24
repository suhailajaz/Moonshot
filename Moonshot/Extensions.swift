//
//  Extensions.swift
//  Moonshot
//
//  Created by suhail on 24/10/24.
//

import Foundation

extension Bundle{
    
    func decode<T: Codable>(_ file: String)-> T{
        
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed to locate the the file: \(file) in the bundle.")
        }
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load the the file: \(file) from the bundle.")

        }
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else{
            fatalError("Failed to decode the data.")
        }
        return decodedData
    }
    
   
    
}
