//
//  GridLayout.swift
//  Moonshot
//
//  Created by suhail on 28/10/24.
//

import SwiftUI

struct GridLayout: View {
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    let astronautData: [String:Astronaut] = Bundle.main.decode("astronauts.json")

    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        ScrollView{
        LazyVGrid(columns: columns){
            ForEach(missions){ mission in
                
                NavigationLink{
                    MissionView(mission: mission,astronauts: astronautData)
                }label:{
                    VStack{
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        VStack{
                            Text(mission.displayName)
                                .foregroundStyle(.white)
                            Text(mission.formattedLaunchDate() ?? "N/A")
                                .font(.caption)
                                .foregroundStyle(.gray)
                            
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                        
                    )
                }
                
            }
        }
    }
        .padding([.horizontal, .bottom])


    }
}

#Preview {
    GridLayout()
}
