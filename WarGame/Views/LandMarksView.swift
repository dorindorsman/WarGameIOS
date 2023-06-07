//
//  LandMarkaView.swift
//  WarGame
//
//  Created by Student18 on 07/06/2023.
//

import SwiftUI

struct LandMarksView: View {
    @EnvironmentObject var locationManager : LocationManager
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                //Header
                Text(viewModel.title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.blue)
                    .bold().onAppear{
                        viewModel.checkLandMarks(latitude: (locationManager.location?.coordinate.latitude ?? 0.0), longitude: (locationManager.location?.coordinate.longitude ?? 0.0))
                    }
                if viewModel.showLocation{
                    //fix that
                    Text("Location:\n\(locationManager.location?.coordinate.latitude ?? 0.0), \(locationManager.location?.coordinate.longitude ?? 0.0)").padding(.bottom).frame(width: 350, alignment: .center)
                    if viewModel.isWest{
                        Image("West")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150, alignment: .leading)
                    }else{
                        Image("East")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150, alignment: .trailing)
                    }
                }
                
                Button {
                    viewModel.startPlay()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.blue)
                            .frame(width: 200)
                        Text("Start Play")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }.padding()
                
                Spacer()
                
                NavigationLink(destination: GameView(name: viewModel.name, isWest: viewModel.isWest) ,isActive: $viewModel.isReadyToPlay){}.hidden()

            }.padding(.top, 10)
        }
    }
}

struct LandMarksView_Previews: PreviewProvider {
    static var previews: some View {
        LandMarksView(viewModel: MainViewModel())
    }
}
