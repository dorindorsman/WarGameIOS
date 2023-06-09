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
    @Published var numOfGame = 0
 

//    @Published var leftScore = 0
//    @Published var rightName = ""
//    @Published var rightScore = 0
      
    
    @Published var playerCard: Card
    @Published var houseCard: Card

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


     func  generateRandomCard() -> Card {
          let randomValue = Int.random(in: 2...14)
          print(randomValue)
          let card = Card(image: "card\(randomValue)", strength: randomValue)
          return card
      }
    
    
    func setPlayerCardRandomly() {
        let randomPlayerCard = self.generateRandomCard() // Use 'self' explicitly
        playerCard = randomPlayerCard

        let randomHouseCard = self.generateRandomCard() // Use 'self' explicitly
        houseCard = randomHouseCard
    }
    
    
//    private func startTurnTimer() {
//
//
//        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] timer in
//            self?.turnCards()
//            self?.gameCount += 1
//            self?.setPlayerCardRandomly()
//
//
//            if self?.gameCount == 10 {
//                self?.endGame()
//                timer.invalidate()
//            }
//        }
//    }
    
    
    func generateBackCard() -> Card
    {
    
        let card = Card(image: "back", strength: 0)
        return card
        
    }
    
    
    func setBackCards() {
        let backPlayerCard = self.generateBackCard() // Use 'self' explicitly
        playerCard = backPlayerCard

        let backHouseCard = self.generateBackCard() // Use 'self' explicitly
        houseCard = backHouseCard
    }
    
    
    
    private func startTurnTimer() {
        var counter = 0
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            if counter % 3 == 0 {
                // Perform the action every 3 seconds
                self?.setBackCards()
              
            }
            
            if counter % 5 == 0 {
                counter = 0
                self?.gameCount += 1
                // Perform the action every 5 seconds
                self?.setPlayerCardRandomly()
                self?.turnCards()

            }
            
            if self?.gameCount == 10 {
                self?.endGame()
                timer.invalidate()
            }
            
            counter += 1
        }
    }
    
    
    
    
    private func turnCards() {
        // Perform card turning logic here
        // Update the playerScore and houseScore based on card comparison
        // For simplicity, let's assume player wins if their card's strength is greater
        
        if playerCard.strength > houseCard.strength {
            playerScore += 1
        } else if playerCard.strength <= houseCard.strength {
            houseScore += 1
        }
    }
    
    private func endGame() {
        self.isGameOver = true
        // Handle end of game logic, navigate to the next page
    }
}


