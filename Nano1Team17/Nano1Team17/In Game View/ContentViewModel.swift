//
//  ContentViewModel.swift
//  Nano1Team17
//
//  Created by Elvis Susanto on 24/03/23.
//

import AVFoundation
import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    
    // Sound Purposes
    @Published var audioPlayer: AVAudioPlayer?
    
    func playWrong() {
        guard let url = Bundle.main.url(forResource: "Wrong", withExtension: "mp3") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    func playSound() {
            guard let url = Bundle.main.url(forResource: "Correct", withExtension: "mpeg") else { return }
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    
    // Timer Purposes
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var userName : String = ""
    @Published var players: [onePlayer] = []
    @Published var dummyPlayer = onePlayer(name:"TST", score: 500)
    
    
    func sortPlayers() {
        var sortedPlayers: [onePlayer] {
            players.sorted(by: { $0.score > $1.score})
        }
        players = sortedPlayers
    }
    
    
    // Page Purposes
    @Published var fromGame: Bool = false
    @Published var pageNumber: Int = 0
    
    // Used for questioning
    @Published var showDamage: Bool = false
    @Published var displayText: String = ""
    @Published var desc: String = ""
    @StateObject var model = ContentModel()
    @Published var currentQuestion = ContentModel.oneQuestion(area: "", pic: "", descs: "")
    
    // Player Purposes
    // User Declaraction
    struct onePlayer: Identifiable, Equatable {
        let id = UUID()
        let name: String
        var score: Int
    }
    
    //Dummy Purposes
//    @State var executeDummy: Bool = true
//    func createDummyPlayers () {
//        if executeDummy == true {
//            for i in 0...15 {
//                let dummyPlayer = onePlayer(name: "HAI", score: i*50)
//                players.append(dummyPlayer)
//                sortPlayers()
//            }
//        }
//        executeDummy = false
//    }
    
    func newLeaderboardEntry () {
        let currentPlayer = onePlayer(name: userName, score: currentScore)
        print(currentPlayer)
        players.append(currentPlayer)
        print(players)
        sortPlayers()
    }
    
    // Current Question
    @Published var currentQuestionDashes: String = ""
    func changeCurrentQuestion () {
        var tempQuestion = model.questions.shuffled()[0]
        while (currentQuestion.area ==  tempQuestion.area) {
            tempQuestion = model.questions.shuffled()[0]
        }
        currentQuestion = tempQuestion
        currentQuestionDashes = ""
        for _ in 0...currentQuestion.area.count-1 {
            currentQuestionDashes.append("-")
        }
        resetAlphabet()
    }
    
    // Score
    @Published var currentScore = 0
    
    // Time
    @Published public var timeRemaining: Int = 0
    
    // Alphabet
    @Published var alphabet: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    func resetAlphabet () {
        alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    }
    
    // Lives
    @Published var lives: Int = 0
    @Published var damage: Int = 0
    
    // Sounds
    @Published var bgmIsOn: Bool = true
    
    // Image
    @Published var isImageShown: Bool = true
    func imageTapped() {
        isImageShown.toggle()
    }
    
    func checkName ()-> Bool {
        for i in 0..<userName.count {
            if !(userName[userName.index(userName.startIndex, offsetBy: i)] >= "A" && userName[userName.index(userName.startIndex, offsetBy: i)] <= "Z") {
                return false
            }
        }
        return true
    }
    
    func answerChecker(_ answerChosen: Character) {
        
        // Jika pilihan huruf ada di dalam pertanyaan maka..
        if currentQuestion.area.contains(answerChosen) {
            
            // Semua dash di index yang seharusnya mengandung huruf tersebut digantikan dengan huruf tersebut.
            for i in 0..<currentQuestion.area.count {
                if currentQuestion.area[currentQuestion.area.index(currentQuestion.area.startIndex, offsetBy: i)] == answerChosen {
                    var charArray = Array(currentQuestionDashes)
                    charArray[i] = answerChosen
                    currentQuestionDashes = String(charArray)
                }
            }
            
            // Alphabet yang menunjukkan huruf tersebut digantikan dengan sebuah spasi
            alphabet = alphabet.replacingOccurrences(of: String(answerChosen), with: " ")
            
            // Jika sudah terjawab semua, ganti pertanyaan dan tambahkan skor.
            if currentQuestionDashes == currentQuestion.area {
                if bgmIsOn == true {
                    playSound()
                }
                changeCurrentQuestion()
                currentScore += 50
            }
            
        // Jika pilihan huruf tidak ada di dalam pertanyaan maka..
        } else if answerChosen.isLetter {
            
            // Alphabet yang menunjukkan huruf tersebut digantikan dengan sebuah spasi
            alphabet = alphabet.replacingOccurrences(of: String(answerChosen), with: " ")
            
            if bgmIsOn == true {
                playWrong()
            }
            
            // Lives berkurang.
            lives -= 1
            
            withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.2, blendDuration: 0.2)){
                showDamage = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.2, blendDuration: 0.2)){
                    self.showDamage = false
                }
            }
            
        }
        
    }
    
}
