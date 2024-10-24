//
//  ContentView.swift
//  Moonshot
//
//  Created by suhail on 23/10/24.
//

import SwiftUI

struct ContentView: View {
    let astronautData: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    let missionData: [Mission] = Bundle.main.decode("missions.json")
    var index = 1
    var body: some View {
    
        ScrollView{
            ForEach(missionData){ item in
                VStack(spacing: 30){
                    Text("\(item.id)")
                    Text(item.description)
                }.padding(.horizontal,10)
                
            }
        }
    }
}

#Preview {
    ContentView()
}
