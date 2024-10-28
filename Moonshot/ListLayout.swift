//
//  ListLayout.swift
//  Moonshot
//
//  Created by suhail on 28/10/24.
//

import SwiftUI

struct ListLayout: View {
 
    let astronautData: [String:Astronaut] = Bundle.main.decode("astronauts.json")

    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        
     
        
        
        List{
            ForEach(missions){ mission in
                NavigationLink{
                    MissionView(mission: mission,astronauts: astronautData)
                }label:{
                    HStack(spacing: 30){
                        Image("apollo15")
                            .resizable()
                        //.scaledToFit()
                            .frame(width: 60, height: 60)
                            .padding(5)
                            .background(.white.opacity(0.5))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay{
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.yellow,lineWidth: 1)
                            }
                        VStack(alignment: .leading){
                            Text(mission.displayName)
                                .font(.title)
                                .foregroundStyle(.white)
                            Text(mission.formattedLaunchDate() ?? "N/A")
                                .font(.title3)
                                .foregroundStyle(.white.opacity(0.5))
                            
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.top)
                    .padding(10)
                    .background(.lightBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay{
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.white)
                    }
                    
                }
                
                .listRowBackground(Color.clear)
                
            }
          //  .frame(maxWidth: .infinity) // Makes the list occupy the full width of the screen
            .listStyle(PlainListStyle())
        }
    }

}

#Preview {
    ListLayout()
}
