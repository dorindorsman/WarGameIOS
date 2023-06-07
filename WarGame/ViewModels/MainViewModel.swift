//
//  MainViewModel.swift
//  WarGame
//
//  Created by Student18 on 07/06/2023.
//

import Foundation

class MainViewModel: ObservableObject{
    
    @Published var name : String = ""
    @Published var title : String = "Welcome !"
    @Published var errorMessage = ""
    
    init(){
        
    }
    
    func setName(){
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please Fill Your Name"
            return
        }
        title = "Welcome " + name + "!"
        print("Called")
    }
    
    func checkLandMarks(){
        
    }
    
}
