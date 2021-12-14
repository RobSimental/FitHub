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
//    @State private var email: String = ""
//    @State private var username: String = ""
//    @State private var password: String = ""
//    @State private var confirmPassword: String = ""
    
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                fithubLogo().padding(.top)
                Spacer()
                VStack {
                    VStack {
                        TextField ("Email Address", text: $fithubViewModel.user.email)
                            .inputTextBoxStyle()
                            .padding(.top)
                        TextField ("Username", text: $fithubViewModel.user.username)
                            .inputTextBoxStyle()
                        SecureField ("Password", text: $fithubViewModel.user.password)
                            .inputTextBoxStyle()
//                        SecureField ("Confirm Password", text: $fithubViewModel.user.cpassword)
//                            .inputTextBoxStyle()
                        NavigationLink(destination: InterestsView(fithubViewModel: fithubViewModel)) {
                            Text("SELECT INTERESTS").loginButtonStyle(color: MainView.fhPurple)
                        }
                        Button(action: {fithubViewModel.register()}){
                            Text("Sign Up").loginButtonStyle(color: .green)
                        }.padding(.bottom)
                    }.padding()
                    
                }.background(MainView.lightPurple)
                Spacer()
            }
            .navigationBarTitle("Register", displayMode: .inline)
        }
    }
}





struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(fithubViewModel: FitHubViewModel())
    }
}
