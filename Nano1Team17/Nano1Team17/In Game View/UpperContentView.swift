//
//  UpperContentView.swift
//  Nano1Team17
//
//  Created by Elvis Susanto on 24/03/23.
//

import Foundation
import SwiftUI

struct UpperContentView: View {
    
    @EnvironmentObject var viewModel : ContentViewModel
    var body: some View {
    
        HStack {
            
            // Score and Lives
            VStack (spacing: 2) {
                
                // Score
                VStack {
                    HStack {
                        Text("Score : \(viewModel.currentScore)")
                            .font(
                                .custom ("SF Pro Display", fixedSize:14)
                                .weight(.thin)
                            )
                        Spacer()
                    }
                    .frame(width: 100)
                    .padding(.leading, 20)
                }
            }
            .frame(width: 120)
            
            Spacer()
            
            //Time left and Timer
            VStack (spacing: -2) {
                
                // Timer
                HStack {
                    Text("Time Left")
                        .font(
                            .custom ("SF Pro Display", fixedSize:12)
                            .bold()
                        )
                }
                
                HStack {
                    Text("\(viewModel.timeRemaining)")
                        .onReceive(viewModel.timer) { _ in
                            if viewModel.timeRemaining > 0 {
                                viewModel.timeRemaining -= 1
                                }
                            }
                        .font(
                            .custom ("SF Pro Display", fixedSize:24)
                            .weight(.thin)
                        )
                }
            }
            .frame(width: 120, height: 40)
            
            Spacer()
            
            // Sounds Button
            VStack {
                HStack {
                    Spacer()
                    Button (action: {viewModel.bgmIsOn.toggle()}) {
                        if (viewModel.bgmIsOn ==  true) {
                            Image(systemName: "speaker.wave.2.fill")
                                .resizable()
                                .frame(width: 30, height: 25)
                                .foregroundColor(Color(.black))
                        } else if viewModel.bgmIsOn == false {
                            Image(systemName: "speaker.slash.fill")
                                .resizable()
                                .frame(width: 30, height: 25)
                                .foregroundColor(Color(.black))
                        }
                    }
                    .padding(.trailing, 20)
                }
                .frame(width: 120)
            }
        }
        
    }
}
