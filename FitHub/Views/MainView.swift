//
//  MainView.swift
//  FitHub
//
//  Created by Roberto on 11/10/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        LoginView(fitHubViewModel: FitHubViewModel())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
