//
//  FitHubRepo.swift
//  FitHub
//
//  Created by Roberto on 11/9/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class FitHubRepo: ObservableObject {
    private let path = "users"
    private let db = Firestore.firestore()
    //@Published private var user: UserModel = UserModel()
    
    //register to db, then calls self.login
    func register(_ user: UserModel,_ fitHubViewModel: FitHubViewModel) {

            db.collection(path).whereField("username", isEqualTo: user.username).getDocuments { (snap,err) in
                if(err != nil){
                    print("failed to login")
                    return
                }
                if let acc = snap {
                    if(acc.documents.isEmpty){
                        do {
                            _ = try self.db.collection(self.path).addDocument(from: user)
                            self.login(user.username, user.password, fitHubViewModel)
                        } catch {
                            print("failed to add")
                        }
                    } else {
                        //Todo send an alert to user
                        print("Username already exists")
                    }
                }else{
                    print("nil result")
                }
            }
    }
    
    //attempts to login the user from database
    func login(_ username: String, _ password: String,_ fitHubViewModel: FitHubViewModel) {
        
        db.collection(path).whereField("username", isEqualTo: username).getDocuments { (snap,err) in
            if(err != nil){
                print("failed to login")
                return
            }
            if let acc = snap {
                //print(acc.documents)
                for i in acc.documents{
                    if (password == i.get("password") as! String) {
                        fitHubViewModel.user.email = i.get("email") as! String
                        let intList = i.get("interests") as! [String]
                        fitHubViewModel.selection.formUnion(intList)
                        //this is updating the Main View so that we leave the login screen
                        //has to be done async because getDocuments is async
                        DispatchQueue.main.async {
                            fitHubViewModel.loggedIn = true
                        }
                    }
                }
            }else{
                print("nil result")
            }
        }
    }
    
    func createEvent(event: EventModel, fitHubViewModel: FitHubViewModel) {
        do {
            _ = try self.db.collection("events").addDocument(from: event)
            getEvents(fitHubViewModel: fitHubViewModel)
        } catch {
            print("failed to add")
        }
    }
    
    func getEvents(fitHubViewModel: FitHubViewModel) {
        print("loading events from database")
        db.collection("events").getDocuments { (snap,err) in
            if(err != nil){
                print("failed to login")
                return
            }
            if let acc = snap {
                for i in acc.documents{
                    let event = EventModel(
                        id: i.documentID,
                        title: i.get("title") as! String,
                        description: i.get("description") as! String,
                        eventCreator: i.get("eventCreator") as! String
                    )
                    DispatchQueue.main.async {
                        if (!fitHubViewModel.eventList.contains(event)) {
                            fitHubViewModel.eventList.append(event)
                        }
                    }
                }
            }else{
                print("nil result")
            }
        }
    }
}
