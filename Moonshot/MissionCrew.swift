//
//  MissionCrew.swift
//  Moonshot
//
//  Created by suhail on 28/10/24.
//

import SwiftUI

struct MissionCrew: View {
    let crew: [CrewMember]

    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack{
                ForEach(crew, id: \.role){ crewMember in
                    NavigationLink{
                        AstronautView(astronaut: crewMember.astronaut)
                        
                        
                    }label:{
                        HStack{
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.white, lineWidth: 1)
                                }
                            VStack(alignment: .leading){
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                }
            }
            
            

        }    }
}

#Preview {
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")

    return MissionCrew(crew: [CrewMember(role: "dummy", astronaut: astronauts["aldrin"]!)])
}
