//
//  UserModel.swift
//  FitHub
//
//  Created by Roberto on 11/10/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserModel:  Codable {
    @DocumentID var id: String?
    var email: String = "Test@mail"
    var username: String = "Rob"
    var password: String = "pass"
    var interests = Set<String>()
    
    //saving Id of events
    var favoriteEvents = Set<String>()
    var blockedEvents = Set<String>()
}
