//
//  LoginView.swift
//  FitHub
//
//  Created by Roberto on 11/7/21.

import SwiftUI

struct LoginView: View {
    @ObservedObject var fitHubViewModel: FitHubViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("partner").resizable().ignoresSafeArea()
                
                VStack(spacing: 0) {
                    fithubLogo()
                    Spacer()
                    welcomeText
                    inputFields
                }
            }
        }
        .accentColor(Color(.label))
        //.navigationBarTitleDisplayMode(.inline)
    }

    var welcomeText: some View {
        Text("Welcome")
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.bold)
    }
    
    var inputFields: some View {
        VStack {
            TextField ("Email Address", text: $fitHubViewModel.user.email)
                .inputTextBoxStyle()
                .opacity(0.9)
            SecureField ("Password", text: $fitHubViewModel.user.password)
                .inputTextBoxStyle()
                .opacity(0.9)
            
            Button(action: {fitHubViewModel.login(email: fitHubViewModel.user.email, password: fitHubViewModel.user.password)}){
                Text("LOGIN").loginButtonStyle(color: .green)
            }
            
            NavigationLink(destination: RegisterView(fithubViewModel: fitHubViewModel)) {
                Text("SIGN UP").loginButtonStyle(color: .pink)
            }
        }
        .padding(.vertical)
        .padding(.horizontal)
    }
}

struct fithubLogo: View {
    var body: some View {
        HStack(spacing: 0) {
            Image("favicon")
                .renderingMode(.template)
            Text("FitHub")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
        .padding(.horizontal, 5)
        .foregroundColor(.white)
        .background(MainView.lightPurple)
        .cornerRadius(30)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView(fitHubViewModel: FitHubViewModel())
//    }
//}
