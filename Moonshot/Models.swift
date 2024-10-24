//
//  Astronauts.swift
//  Moonshot
//
//  Created by suhail on 24/10/24.
//

import Foundation

struct Astronaut: Codable, Identifiable{
        let id: String
        let name: String
        let description: String
}



struct Mission: Codable,Identifiable{
        let id: Int
        let crew: [Crew]
        let description: String
}

struct Crew: Codable{
    let name: String
    let role: String
}
