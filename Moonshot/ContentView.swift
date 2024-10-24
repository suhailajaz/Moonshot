//
//  ContentView.swift
//  Moonshot
//
//  Created by suhail on 23/10/24.
//

import SwiftUI

struct ContentView: View {
    let astronautData = Bundle.main.decode("astronauts.json")
    var index = 1
    var body: some View {
        
       
        Text(String(astronautData.count))
       
    }
}

#Preview {
    ContentView()
}
