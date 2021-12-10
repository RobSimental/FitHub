//
//  FitHubViewModel.swift
//  FitHub
//
//  Created by Roberto on 11/9/21.
//

import Foundation

class FitHubViewModel: ObservableObject {
    static let interestList = ["Weight Lifting", "Running", "Hiking", "Biking", "Basketball", "Soccer"]
    @Published var selection = Set<String>()
    private var repo = FitHubRepo()
    @Published var user = UserModel()
    @Published var eventList: [EventModel] = []
    @Published var eventCreator: Bool = false
    @Published var loggedIn: Bool = false
    
    func register(){
        //may need to await
        //repo.register(user)
        login(email: user.email, password: user.password)
    }
    func login(email: String, password: String) {
        loggedIn = repo.login(email, password)
    }
    func createEvent(event: EventModel) {
        
        eventList.append(event)
    }
}
