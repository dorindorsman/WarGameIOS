//
//  WarGameApp.swift
//  WarGame
//
//  Created by Student18 on 06/06/2023.
//

import SwiftUI

@main
struct WarGameApp: App {
    @StateObject var locationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(locationManager)
        }
    }
}
