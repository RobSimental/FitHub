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
    var email: String = "test@mail"
    var username: String = "Test User"
    var password: String = "test"
    //var cpassword: String = ""
    var interests: [String] = []
}
