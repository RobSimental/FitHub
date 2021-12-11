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
    var email: String = "Rob"
    var username: String = "Test User"
    var password: String = "pass"
    //var cpassword: String = ""
    var interests: [String] = []
}
