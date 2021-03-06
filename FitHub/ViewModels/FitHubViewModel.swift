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
    }
    
    func getEvents() {
        repo.getEvents(fitHubViewModel: self)
    }
    
    func getUserEvents(user: UserModel) {
        eventList.removeAll()
        repo.getUserEvents(user: user, fitHubViewModel: self)
    }
    
    func favoriteEvent(eventID: String?) {
        if let id = eventID {
            user.favoriteEvents.insert(id)
            repo.favoriteEvent(event: id, fitHubViewModel: self)
        } else {
            print("null eventID")
        }
    }
    func unfavoriteEvent(eventID: String?) {
        if let id = eventID {
            user.favoriteEvents.remove(id)
            repo.unfavoriteEvent(event: id, fitHubViewModel: self)
        } else {
            print("null eventID")
        }
    }
    func getFavoriteEvents() {
        eventList.removeAll()
        repo.getFavoriteEvents(fitHubViewModel: self)
    }
    func blockEvent(eventID: String?){
        if let id = eventID {
            eventList.removeAll(where: {$0.id == id})
            user.blockedEvents.insert(id)
            repo.blockEvent(event: id, fitHubViewModel: self)
        }
        self.getEvents()
    }
    func deleteEvent(eventID: String?) {
        if let id = eventID {
            eventList.removeAll(where: {$0.id == id})
            repo.deleteEvent(event: id, fitHubViewModel: self)
        }
    }
}
