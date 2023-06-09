//
//  ScoreView.swift
//  WarGame
//
//  Created by Student18 on 07/06/2023.
//

import SwiftUI

struct ScoreView: View {
    @StateObject private var viewModel: ScoreViewModel
    
    var winner: String

    init(winner: String){
        _viewModel = StateObject(wrappedValue: ScoreViewModel())
        self.winner = winner
    }
    
    var body: some View {
        //Text("Hello, World!")
        NavigationView{
            VStack{
                
                VStack {
                    //Header
                    Text(viewModel.title)
                        .font(.system(size: 50))
                        .foregroundColor(Color.blue)
                        .bold()
                }.padding(.top, 30)
                
                //Button
                Button {
                    viewModel.setTitle()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.blue)
                            .frame(width: 150, height: 50)
                        Text("Back to Menu")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }.padding()
                
                Spacer()
                
//                NavigationLink(destination: LandMarksView(viewModel: viewModel),isActive: $viewModel.isLinkActive){}.hidden()
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(winner:
        "liron")
    }
}
