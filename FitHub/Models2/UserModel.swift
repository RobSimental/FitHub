//
//  UserModel.swift
//  FitHub
//
//  Created by Roberto on 11/10/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserModel: Identifiable, Codable {
    @DocumentID var id: String?
    var email: String = ""
    var username: String = ""
    var password: String = ""
    var interests: [String] = []
    
    
}
