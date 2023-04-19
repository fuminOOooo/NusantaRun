//
//  ContentView.swift
//  nanoLogin
//
//  Created by yuri wardana on 24/03/23.
//

import SwiftUI

struct LandingView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        NavigationView  {
            if viewModel.pageNumber == 0 {
                
                VStack {
                    
                    // Audio Button
                    HStack{
                        
                        Button (
                            action: {
                                withAnimation {
                                    viewModel.fromGame = false
                                    viewModel.pageNumber = 2
                                }
                        }
                        ) {
                            Image(systemName: "medal.fill")
                                .resizable()
                                .frame(width: 25, height: 30)
                                .foregroundColor(Color(.black))
                            Spacer()
                        }
                        .padding(.leading, 20)
                        .frame(width: 120)
                        
                        Spacer()
                        Button (action: {viewModel.bgmIsOn.toggle()}) {
                            Spacer()
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
                        .frame(width: 120)
                    }
                    
                    
                    // Semua dibawah Audio Button
                    VStack {
                        
                        VStack (spacing: 20) {
                            Image("LandingImage")
                                .resizable()
                                .frame(width: 250, height: 250)
                                .cornerRadius(15)
                            VStack {
                                Text("VIP - 17 presents")
                                    .font(
                                        .custom("SFProDisplay",
                                                size: 13)
                                    )
                                    .foregroundColor(.gray)
                                Text("NUSANTA-RUN")
                                    .font(
                                        .custom("SFCompactText-Bold",
                                                size: 40)
                                    )
                                    .fontWeight(.bold)
                                Text("Perbesar test pengetahuan nusantaramu dengan\nbenda-benda ciri khas berbagai daerah!")
                                    .multilineTextAlignment(.center)
                                    .font(.custom("SFProDisplay", size: 14))
                                    .lineLimit(nil)
                            }
                        }
                        
                    }
                    
                    VStack{
                        Text("Player Name")
                            .foregroundColor(.gray)
                            .font(.custom("SFProDisplay", size: 11))
                        
                        TextField("", text: $viewModel.userName)
                            .frame(width: 150, height: 50)
                            .font(.custom("SFProDisplay", size: 28))
                            .multilineTextAlignment(.center)
                            .background(Color(.white))
                            .shadow(radius: 30)
                            .textFieldStyle(PlainTextFieldStyle())
                            .textInputAutocapitalization(.characters)
                            .disableAutocorrection(true)
                            .onChange(of: viewModel.userName) { newValue in
                                if newValue.count > 3 {
                                    viewModel.userName = String(newValue.prefix(3))
                                }
                            }
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button (action: {
                        if viewModel.userName.count == 3 && viewModel.checkName() {
                            viewModel.fromGame = false
                            viewModel.currentScore = 0
                            viewModel.timeRemaining = 120
                            viewModel.lives = 8
                            viewModel.damage = 0
                            viewModel.pageNumber = 1
                        }
                    })
                    { if (viewModel.userName.count ==  3) && viewModel.checkName() {
                            VStack {
                                Text("Insert a name before playing.")
                                    .font(.custom("SFProDisplay",
                                                  size: 10))
                                    .disabled(true)
                                    .hidden()
                                Image(systemName: "play.circle.fill")
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .foregroundColor(Color(.black))
                            }
                        } else {
                            VStack {
                                Text("Insert a name before playing\n(capital letters only).")
                                    .foregroundColor(Color(.black))
                                    .disabled(true)
                                    .font(.custom("SFProDisplay",
                                                  size: 10))
                                Image(systemName: "play.circle.fill")
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .foregroundColor(Color(.gray))
                                    .disabled(true)
                            }
                        }
                    }
                    
                }
                .padding()
            }
             else if viewModel.pageNumber == 1 {
                 ContentView().environmentObject(viewModel)
             } else if viewModel.pageNumber == 2 {
                 LeaderboardView().environmentObject(viewModel)
                     
             }
        }
//        .onAppear() {
//            viewModel.createDummyPlayers()
//        }
    }
}
