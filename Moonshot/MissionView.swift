//
//  MissionView.swift
//  Moonshot
//
//  Created by suhail on 27/10/24.
//

import SwiftUI

struct CrewMember{
    let role: String
    let astronaut: Astronaut
}

struct MissionView: View {
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView{
            VStack{
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal){ width, axis in
                        width * 0.6
                    }
                    .padding(.top)
                
                if let launchDate = mission.formattedLaunchDate(){
                    Text("Launch Date: \(launchDate)")
                        .font(.title2.smallCaps())
                }
                 
                VStack(alignment: .leading){
                 RectangularDivider()
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom,5)
                    Text(mission.description)
                    
                   RectangularDivider()
                    
                    Text("Crew")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
                        .padding(.bottom,5)
                }
                .padding(.horizontal)
                MissionCrew(crew: self.crew)
            }
            .padding(.bottom)
        }
        
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    init(mission: Mission, astronauts: [String:Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map{ member in
            if let astronaut = astronauts[member.name]{
                return CrewMember(role: member.role, astronaut: astronaut)
            }else{
                fatalError("Missing \(member.name)")
            }
        }
        
    }

}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return MissionView(mission: missions[0],astronauts: astronauts)
        .preferredColorScheme(.dark)
}
