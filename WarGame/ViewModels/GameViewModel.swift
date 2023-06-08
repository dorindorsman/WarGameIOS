//
//  GameViewModel.swift
//  WarGame
//
//  Created by Student18 on 07/06/2023.
//

import Foundation



class GameViewModel: ObservableObject{
    @Published var playerScore = 0
    @Published var houseScore = 0
    @Published var gameCount :Int = 0
    @Published var isGameOver = false
    @Published var playerName :String = ""
    @Published var isPlayerWest = false
    @Published var alignHouse = ""
    @Published var alignPlayer = ""
//    @Published var leftScore = 0
//    @Published var rightName = ""
//    @Published var rightScore = 0
      
    
    var playerCard: Card
    var houseCard: Card
    
    init(isWest: Bool, name: String) {
        playerName = name
        isPlayerWest = isWest
        playerCard = Card(image: "back", strength: 0)
        houseCard = Card(image: "back", strength: 0)
        
        startGame()
    }
    
    func startGame() {
        isGameOver = false
        gameCount = 0
        playerScore = 0
        houseScore = 0
        
        startTurnTimer()
    }
    
    private func startTurnTimer() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] timer in
            //    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in

            self?.turnCards()
            self?.gameCount += 1
            
            if self?.gameCount == 10 {
                self?.endGame()
                timer.invalidate()
            }
        }
    }
    
    private func turnCards() {
        // Perform card turning logic here
        // Update the playerScore and houseScore based on card comparison
        // For simplicity, let's assume player wins if their card's strength is greater
        
        if playerCard.strength > houseCard.strength {
            playerScore += 1
        } else if playerCard.strength < houseCard.strength {
            houseScore += 1
        }
    }
    
    private func endGame() {
        isGameOver = true
        // Handle end of game logic, navigate to the next page
    }
}


