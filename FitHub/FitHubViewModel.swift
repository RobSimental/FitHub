//
//  FitHubViewModel.swift
//  FitHub
//
//  Created by Roberto on 11/9/21.
//

import Foundation

class FitHubViewModel: ObservableObject {
    private static let interestList = ["Weight Lifting", "Running", "Hiking"]
    private var repo = FitHubRepo()
    private var user = UserModel()
    
    //creates new user model then calls repo to register to db
    func register(email: String, username: String, password: String, interests: [String]) {
        user.email = email
        user.password = password
        user.username = username
        user.interests = interests
        
        repo.register(user)
    }
    func login(email: String, password: String) {
        repo.login(email, password)
    }
}
