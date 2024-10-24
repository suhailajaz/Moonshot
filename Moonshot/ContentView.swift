//
//  ContentView.swift
//  Moonshot
//
//  Created by suhail on 23/10/24.
//

import SwiftUI

struct ContentView: View {
   
    let astronautData: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(missions){ mission in
                        
                        NavigationLink{
                            Text("Detail View")
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
                                    Text(mission.formattedLaunchDate)
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
                .padding([.horizontal, .bottom])

            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)

        }
       
    }
}

#Preview {
    ContentView()
}
