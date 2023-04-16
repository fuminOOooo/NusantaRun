//
//  MiddleContentView.swift
//  Nano1Team17
//
//  Created by Elvis Susanto on 24/03/23.
//

import Foundation
import SwiftUI

struct MiddleContentView: View {
    @EnvironmentObject var viewModel : ContentViewModel
    var body: some View {
        HStack {
            VStack {
                
                //Warning
                if viewModel.isImageShown == true {
                    Text("Tap the image to view trivia.")
                        .font(
                            .custom ("SF Pro Display", fixedSize:14)
                            .weight(.thin)
                        ).foregroundColor(Color(.gray))
                } else {
                    Text("Tap the trivia to view image.")
                        .font(
                            .custom ("SF Pro Display", fixedSize:14)
                            .weight(.thin)
                        ).foregroundColor(Color(.gray))
                    
                }
                
                ZStack {
                    //Description
                    Image(systemName: "square.fill")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .foregroundColor(Color(.gray)).opacity(0.1)
                    Text("\(viewModel.currentQuestion.descs)")
                        .font(
                            .custom ("SF Pro Display", fixedSize:12)
                            .weight(.thin)
                        )
                        .frame(width: 250, height: 300)
                        .multilineTextAlignment(.center)
                    
                    // Image
                    Button (action: viewModel.imageTapped) {
                        if (viewModel.isImageShown == true) {
                            ZStack {
                                Image(systemName: "square.fill")
                                    .resizable()
                                    .frame(width: 300, height: 300)
                                    .foregroundColor(Color (.black))
                                    .cornerRadius(40)
                                Image(viewModel.currentQuestion.pic)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 250, height: 250)
                                    .cornerRadius(40)
                                    .clipped()
                            }
                        } else {
                            Image(systemName: "square.fill")
                                .resizable()
                                .frame(width: 300, height: 300)
                                .foregroundColor(Color(.gray)).opacity(0.2)
                        }
                    }
                }
                
                HStack (spacing: 1) {
                    ForEach(0..<viewModel.lives) { i in
                        if (i < viewModel.lives) {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(height: 11)
                                .foregroundColor(Color(.systemRed))
                        } else {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(height: 11)
                                .foregroundColor(Color(.black))
                        }
                    }
                }.frame(width: 100)
                
                VStack {
                    
                    HStack {
                        Spacer()
                        //Skip Button
                        Button {
                            viewModel.changeCurrentQuestion()
                            print(viewModel.currentQuestion)
                        } label: {
                            Text("Skip")
                                .font(
                                    .custom ("SF Pro Display", fixedSize:18)
                                    .weight(.thin)
                                ).foregroundColor(Color(.black))
                        }
                    }.frame(width: 300,height: 50)
                    
                }
                
            }
        }
    }
}
