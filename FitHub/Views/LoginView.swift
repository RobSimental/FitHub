//
//  LoginView.swift
//  FitHub
//
//  Created by Roberto on 11/7/21.
// this is the devlop branch

import SwiftUI

struct LoginView: View {
    @ObservedObject var fitHubViewModel: FitHubViewModel

    
    let lightPurple = Color(red: 76/255, green: 76/255, blue: 109/255, opacity: 1)
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                //background image
                Image("partner").resizable().ignoresSafeArea()
                
                VStack(spacing: 0) {
                    fithubLogo
                    Spacer()
                    welcomeText
                    inputFields
                }
            }
        }
    }
    var fithubLogo: some View {
        HStack(spacing: 0) {
            Image("favicon")
                .renderingMode(.template)
            Text("FitHub")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
        .padding(.horizontal, 5)
        .foregroundColor(.white)
        .background(lightPurple)
        .cornerRadius(30)
    }
    var welcomeText: some View {
        Text("Welcome")
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.bold)
    }
    var inputFields: some View {
        VStack {
            TextField ("Email Address", text: $email)
                .inputTextBoxStyle()
                .opacity(0.9)
            SecureField ("Password", text: $password)
                .inputTextBoxStyle()
                .opacity(0.9)
            
            Button(action: {fitHubViewModel.login(email: "rob", password: password)}){
                Text("LOGIN").loginButtonStyle(color: .green)
            }
            
            NavigationLink(destination: RegisterView(fithubViewModel: fitHubViewModel)) {
                Text("REGISTER").loginButtonStyle(color: .pink)
            }
        }
        .padding(.vertical)
        .padding(.horizontal)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(fitHubViewModel: FitHubViewModel())
    }
}
