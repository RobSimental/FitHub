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
    @State private var isLoggedIn: Bool = false
    var body: some View {
        if(!isLoggedIn) {
            
            ZStack {
                //background image
                Image("partner").resizable().ignoresSafeArea()
                
                VStack {
                    fithubLogo
                    Spacer()
                    welcomeText
                    inputFields
                }

            }
        } else {
            
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
        .foregroundColor(lightPurple)
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
                .padding()
                .background(Color.white)
                .cornerRadius(5)
                .padding(.bottom,20)
                .opacity(0.9)
            SecureField ("Password", text: $password)
                .padding()
                .background(Color.white)
                .cornerRadius(5)
                .padding(.bottom,20)
                .opacity(0.9)
            
            Button(action: {fitHubViewModel.login(email: "rob", password: password)}){
                loginButtonText
            }
            Button (action: {fitHubViewModel.register(email: "rob@mail", username: "rob", password: "pass", interests: ["Weight Lifting"])}) {
                registerButtonText
            }
        }
        .padding(.vertical)
        .padding(.horizontal)
    }
    

    
    var loginButtonText: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)
    }
    var registerButtonText: some View {
        Text("SIGN UP")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.pink)
            .cornerRadius(15.0)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(fitHubViewModel: FitHubViewModel())
    }
}
