//
//  FitHubViewModel.swift
//  FitHub
//
//  Created by Roberto on 11/9/21.
//

import Foundation
//ViewModel interacts with the Model and calls the functions from Repository

class FitHubViewModel: ObservableObject {
    static let interestList = ["Weight Lifting", "Running", "Hiking", "Biking", "Basketball", "Soccer"]
    @Published var selection = Set<String>()
    private var repo = FitHubRepo()
    @Published var user = UserModel()
    @Published var eventList: [EventModel] = []
    @Published var createEventView: Bool = false
    @Published var loggedIn: Bool = false
    
    func register() {
        //update user interests from selection
        user.interests.formUnion(selection)
        repo.register(user, self)
    }
    
    func login(username: String, password: String) {
        repo.login(username, password, self)
    }
    
    func createEvent(event: EventModel) {
        repo.createEvent(event: event, fitHubViewModel: self)
        //eventList.append(event)
        //print(eventList)
    }
    
    func getEvents() {
        repo.getEvents(fitHubViewModel: self)
    }
}
