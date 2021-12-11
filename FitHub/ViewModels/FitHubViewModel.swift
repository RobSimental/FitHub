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
    @Published var createEventView: Bool = false
    @Published var loggedIn: Bool = false
    
    func register()  {
        //repo.register(user)
         login(username: user.username, password: user.password)
    }
    
    func login(username: String, password: String) {
        repo.login(username, password, self)
    }
    
    func createEvent(event: EventModel) {
        
        eventList.append(event)
    }
}
