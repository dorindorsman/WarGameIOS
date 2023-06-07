//
//  GameView.swift
//  WarGame
//
//  Created by Student18 on 07/06/2023.
//

import SwiftUI

struct GameView: View {
    var name: String
    var isWest: Bool
    
    var body: some View {
        Text(name + isWest.description)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(name: "dorin", isWest: true)
    }
}
