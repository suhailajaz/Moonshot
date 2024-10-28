//
//  ContentView.swift
//  Moonshot
//
//  Created by suhail on 23/10/24.
//

import SwiftUI

struct ContentView: View {
   
    @State private var isShowingGrid = false
    var body: some View {
        
        NavigationStack{
            
            Group{
                if isShowingGrid{
                    GridLayout()
                }else{
                    ListLayout()
                    
                }
            }
            
            
            .navigationTitle("Moonshot")
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    self.isShowingGrid.toggle()
                }label: {
                    Image(systemName: "switch.2")
                }
            }
            //.background(.darkBackground)
            
            
        }
    }
}

#Preview {
    ContentView()
}
