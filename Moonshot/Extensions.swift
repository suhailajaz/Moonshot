//
//  Extensions.swift
//  Moonshot
//
//  Created by suhail on 24/10/24.
//

import Foundation
import SwiftUI
extension Bundle{
    
    func decode<T: Codable>(_ file: String)-> T{
        
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed to locate the the file: \(file) in the bundle.")
        }
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load the the file: \(file) from the bundle.")

        }
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        guard let decodedData = try? decoder.decode(T.self, from: data) else{
            fatalError("Failed to decode the data.")
        }
        return decodedData
    }
    
   
    
}

extension ShapeStyle where Self == Color{
    static var darkBackground: Color{
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    static var lightBackground: Color{
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }

}
