//
//  MainView.swift
//  FitHub
//
//  Created by Roberto on 11/10/21.
//

import SwiftUI

struct MainView: View {
    static let lightPurple = Color(red: 76/255, green: 76/255, blue: 109/255, opacity: 1)
    static let fhPurple = Color("fhPurple")
    
    @ObservedObject var fitHubViewModel: FitHubViewModel


    var body: some View {
        if (fitHubViewModel.loggedIn) {
            EventView(fitHubViewModel: fitHubViewModel)
        } else {
            LoginView(fitHubViewModel: fitHubViewModel)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(fitHubViewModel: FitHubViewModel())
    }
}
