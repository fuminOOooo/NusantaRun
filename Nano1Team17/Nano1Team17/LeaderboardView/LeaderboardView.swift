//
//  LeaderboardView.swift
//  Nano1Team17
//
//  Created by Elvis Susanto on 22/03/23.
//

import Foundation
import SwiftUI

struct LeaderboardView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    var body: some View {
        if (viewModel.pageNumber == 2) {
            VStack {
                
                VStack {
                    
                    Spacer()
                    
                    Text("LEADERBOARD")
                    List {
                        ForEach(Array(viewModel.players.enumerated()), id: \.1.id) { (index, myData) in
                            HStack {
                                Text("\(index + 1). \(myData.name)")
                                    .id(myData.id)
                                Spacer()
                                Text("\(myData.score)")
                            }
                        }
                    }
                    .frame(width: 361, height: 600)
                    .cornerRadius(30)
                    Spacer()
                }
                
                HStack {
                    Button (
                        action: {
                        viewModel.pageNumber = 0
                    }
                    ) {
                        Text("Main Menu")
                            .foregroundColor(Color(.black))
                    }
                }
                .frame(width: 150, height: 40)
                .background(Color(.white))
                .cornerRadius(5)
                .shadow(radius: 5)
                .foregroundColor(Color(.black))
                Spacer()
                
            }
            .onAppear() {
                if viewModel.fromGame == true {
                    viewModel.newLeaderboardEntry()
                } 
            }
        } else if (viewModel.pageNumber == 0) {
            LandingView().environmentObject(viewModel)
        }
        
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
