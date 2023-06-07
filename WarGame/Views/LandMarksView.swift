//
//  LandMarkaView.swift
//  WarGame
//
//  Created by Student18 on 07/06/2023.
//

import SwiftUI

struct LandMarksView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                //Header
                Text(viewModel.title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.blue)
                    .bold()
            }.padding(.top, 30)
            
            
        }
        
    }
}

struct LandMarksView_Previews: PreviewProvider {
    static var previews: some View {
        LandMarksView()
    }
}
