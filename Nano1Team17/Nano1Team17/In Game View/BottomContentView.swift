//
//  BottomContentView.swift
//  Nano1Team17
//
//  Created by Elvis Susanto on 24/03/23.
//

import Foundation
import SwiftUI

struct BottomContentView: View {
    
    @EnvironmentObject var viewModel : ContentViewModel
    
    var body: some View {
        
        VStack (spacing: 10) {
            
            // Dashes to be answered
            HStack (spacing: 50) {
                
                Text(String(viewModel.currentQuestionDashes))
                    .font(
                        .custom("SF Pro Display", fixedSize:40)
                        .weight(.thin)
                    )
                
            }
            
            Spacer()
            
            // Keyboard
            
            // Alphabet Answers A - I
            HStack (spacing: 10) {
                
                ForEach(0..<9) { i in
                    Button {
                        viewModel.answerChecker(viewModel.alphabet[viewModel.alphabet.index(viewModel.alphabet.startIndex, offsetBy: i)])
                    } label: {
                        Text("\(String(viewModel.alphabet[viewModel.alphabet.index(viewModel.alphabet.startIndex, offsetBy: i)]))")
                            .font(
                                .custom("SF Pro Display", fixedSize:25)
                                .weight(.thin)
                            )
                            .frame(width: 30)
                            .background(Color(.white))
                            .cornerRadius(5)
                            .shadow(radius: 5)
                            .foregroundColor(Color(.black))
                    }
                    
                }
                
            }
            
            // Alphabet Answers J - R
            HStack (spacing: 10) {
                
                ForEach(9..<18) { i in
                    Button {
                        viewModel.answerChecker(viewModel.alphabet[viewModel.alphabet.index(viewModel.alphabet.startIndex, offsetBy: i)])
                    } label: {
                        Text("\(String(viewModel.alphabet[viewModel.alphabet.index(viewModel.alphabet.startIndex, offsetBy: i)]))")
                            .font(
                                .custom("SF Pro Display", fixedSize:25)
                                .weight(.thin)
                            )
                            .frame(width: 30)
                            .background(Color(.white))
                            .cornerRadius(5)
                            .shadow(radius: 5)
                            .foregroundColor(Color(.black))
                    }
                    
                }
                
            }
            
            // Alphabet Answers S - Z
            HStack (spacing: 10) {
                
                ForEach(18..<26) { i in
                    Button () {
                        viewModel.answerChecker(viewModel.alphabet[viewModel.alphabet.index(viewModel.alphabet.startIndex, offsetBy: i)])
                    } label: {
                        Text("\(String(viewModel.alphabet[viewModel.alphabet.index(viewModel.alphabet.startIndex, offsetBy: i)]))")
                            .font(
                                .custom("SF Pro Display", fixedSize:25)
                                .weight(.thin)
                            )
                            .frame(width: 30)
                            .background(Color(.white))
                            .cornerRadius(5)
                            .shadow(radius: 5)
                            .foregroundColor(Color(.black))
                    }
                }
                
            }
            
            Spacer()
        }
    }
}
