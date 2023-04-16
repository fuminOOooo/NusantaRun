//
//  ContentView.swift
//  Nano1Team17
//
//  Created by Elvis Susanto on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel : ContentViewModel
    var body: some View {
        // Should all the criteria be fulfilled, the game should end (switch screens
        if (viewModel.lives > 0 && viewModel.timeRemaining > 0) {
            ZStack {
                    NavigationView () {
                        
                        // Whole Page VStack
                        VStack (spacing: 10) {
                            // First Row (Score, Lives, Timer, Sound)
                            UpperContentView()
                                .environmentObject(viewModel)
                            Spacer()
                            
                            // Second Row (Tips, Image, Skip Button)
                            MiddleContentView()
                                .environmentObject(viewModel)
                            Spacer()
                            
                            // Third Row (Answer, Keyboard)
                            BottomContentView()
                                .environmentObject(viewModel)
                            Spacer()
                        }
                        
                    }
                    
                    // Start logic of questions
                    .onAppear() {
                        viewModel.changeCurrentQuestion()
                    }
                    .frame(width: 361)
                
            }
            .offset(x: viewModel.showDamage ? -30 : 0)
            
        } else {
            
            LeaderboardView()
                .environmentObject(ContentViewModel())
                .onAppear()
                {
                    viewModel.newLeaderboardEntry()
                    viewModel.pageNumber = 2
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
