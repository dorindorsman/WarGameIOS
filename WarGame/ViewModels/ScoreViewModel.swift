//
//  ScoreViewModel.swift
//  WarGame
//
//  Created by Student18 on 07/06/2023.
//

import Foundation


class ScoreViewModel: ObservableObject{
    @Published var winner : String = ""
    @Published var title : String = ""
    @Published var isLinkActive = true

    
    init()
    {
        
    }
    
    
    func setTitle(){

        title = "The Winner is " + winner + "!"
        isLinkActive = true
    }
    
    
}
