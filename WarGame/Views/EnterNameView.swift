//
//  EnterNameView.swift
//  WarGame
//
//  Created by Student18 on 07/06/2023.
//

import SwiftUI

struct EnterNameView: View {
    @StateObject var viewModel = MainViewModel()
    @State var isLinkActive = false
    
    var body: some View {
        NavigationView{
            VStack{
                VStack {
                    //Header
                    Text(viewModel.title)
                        .font(.system(size: 50))
                        .foregroundColor(Color.blue)
                        .bold()
                }.padding(.top, 30)
                
                //Name Form
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Enter Your Name",text: $viewModel.name )
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    Button {
                        viewModel.setName()
                        if !viewModel.name.isEmpty{
                            self.isLinkActive = true
                        }
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)
                            Text("Submit")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }.padding()
                    
                    
                }
                Spacer()
                
                NavigationLink(destination: LandMarksView(),isActive: $isLinkActive){}.hidden()
                
            }
        }
    }
}

struct EnterNameView_Previews: PreviewProvider {
    static var previews: some View {
        EnterNameView()
    }
}
