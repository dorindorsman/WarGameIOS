//
//  GameView.swift
//  WarGame
//
//  Created by Student18 on 07/06/2023.
//

import SwiftUI


struct GameView: View {
    //var name: String
    var isWest: Bool
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel: GameViewModel

    init(isWest: Bool, name: String) {
        _viewModel = StateObject(wrappedValue: GameViewModel(isWest: isWest, name: name))
        self.isWest = isWest
    }
    
    
    
    var body: some View {
        if viewModel.isGameOver{
            
            NavigationLink(destination: ScoreView(winner: viewModel.playerName)){}
            
           
        }
       
        ZStack{
            Image("background-wood-grain")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                
                HStack{
                    Spacer()
            
                    if isWest{
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
        }
      
    }
    
    
//    NavigationView{
//        if viewModel.isGameOver {
//
//        }
//    }
    
    
}



struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(isWest: true, name: "dorin")
    }
}

