//
//  GameView.swift
//  WarGame
//
//  Created by Student18 on 07/06/2023.
//

import SwiftUI


struct GameView: View {
    //var name: String
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel: GameViewModel
    
    init(isWest: Bool, name: String) {
        _viewModel = StateObject(wrappedValue: GameViewModel(isWest: isWest, name: name))
    }
    
    var body: some View {
            ZStack{
                Image("background-wood-grain")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    Spacer()
                    
                    HStack{
                        
                        Spacer()
                        
                        if viewModel.isPlayerWest {
                            VStack{
                                Text(viewModel.playerName)
                                    .font(.headline)
                                    .padding(.bottom,2)
                                Text("\(viewModel.playerScore)")
                                    .font(.largeTitle)
                            }        .alignmentGuide(.leading) { _ in
                                0 // Aligns the image to the right within its container
                            }
                            Spacer()
                            Image("logo")
                            Spacer()
                            VStack{
                                Text("PC")
                                    .font(.headline)
                                    .padding(.bottom,2)
                                Text("\(viewModel.houseScore)")
                                    .font(.largeTitle)
                            }        .alignmentGuide(.leading) { _ in
                                0 // Aligns the image to the right within its container
                            }
                            Spacer()
                        } else {
                            VStack{
                                Text("PC")
                                    .font(.headline)
                                    .padding(.bottom,2)
                                Text("\(viewModel.houseScore)")
                                    .font(.largeTitle)
                            }        .alignmentGuide(.leading) { _ in
                                0 // Aligns the image to the right within its container
                            }
                            Spacer()
                            Image("logo")
                            Spacer()
                            
                            
                            VStack{
                                Text(viewModel.playerName)
                                    .font(.headline)
                                    .padding(.bottom,2)
                                Text("\(viewModel.playerScore)")
                                    .font(.largeTitle)
                            }        .alignmentGuide(.leading) { _ in
                                0 // Aligns the image to the right within its container
                            }
                            Spacer()
                        }
                        
                    }.foregroundColor(.white)
                    
                    HStack{
                        Spacer()
                        Image(viewModel.playerCard.image)
                        Spacer()
                        VStack{
                            Image("timer")
                                .resizable()
                                .frame(width: 80, height: 80)
                            Text("\(viewModel.gameCount)")
                                .font(.largeTitle)
                        }.foregroundColor(.white)
                        Spacer()
                        Image(viewModel.houseCard.image)
                        Spacer()
                    }
                    Spacer()
                }
                
                NavigationLink(destination: ScoreView(winner: viewModel.winner, score: viewModel.winnerScore), isActive: $viewModel.isGameOver){}.hidden()
                
            }
        }
    }




struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(isWest: true, name: "dorin")
    }
}

