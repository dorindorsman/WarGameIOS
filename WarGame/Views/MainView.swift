//
//  MainView.swift
//  WarGame
//
//  Created by Student21 on 08/06/2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var locationManager : LocationManager
    @StateObject var viewModel = MainViewModel()
   
    var body: some View {
        if !viewModel.isLinkActive{
             EnterNameView(viewModel: viewModel)
        }  else{
            LandMarksView(viewModel: viewModel).environmentObject(locationManager)
        }   }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(LocationManager())
    }
}
