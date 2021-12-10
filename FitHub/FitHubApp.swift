//
//  FitHubApp.swift
//  FitHub
//
//  Created by Roberto on 11/7/21.
//

import SwiftUI
import Firebase

@main
struct FitHubApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            MainView(fitHubViewModel: FitHubViewModel())
        }
    }
}
