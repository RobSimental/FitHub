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
    @Published private var user: UserModel = UserModel()
    
    //register to db
    func register(_ user: UserModel) {
        do {
            _ = try db.collection(path).addDocument(from: user)
        } catch {
            print("Adding a study card failed")
        }
    }
    
    
    func login(_ email: String, _ password: String,_ fitHubViewModel: FitHubViewModel) {
        
        db.collection(path).whereField("email", isEqualTo: email).getDocuments { (snap,err) in
            if(err != nil){
                print("failed to login")
                return
            }
            if let acc = snap {
                for i in acc.documents{
                    if (password == i.get("password") as! String) {
                        fitHubViewModel.user.username = i.get("username") as! String
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
}
