//
//  RegisterView.swift
//  FitHub
//
//  Created by Roberto on 11/10/21.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var fithubViewModel: FitHubViewModel
    //visible variables that change as user types
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var username: String = ""
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//struct RegisterView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterView(fithubViewModel: FitHubViewModel())
//    }
//}
