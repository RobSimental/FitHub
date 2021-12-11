//
//  EventModel.swift
//  FHOffline
//
//  Created by Roberto on 12/9/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct EventModel: Codable, Identifiable, Equatable {
    @DocumentID var id: String?
    var title: String = "Test"
    var description: String = "This is an event"
    var eventCreator: String
    
    static func ==(lhs: EventModel, rhs: EventModel) -> Bool {
        return lhs.id == rhs.id
    }
}
