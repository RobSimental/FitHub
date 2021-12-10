//
//  EventModel.swift
//  FHOffline
//
//  Created by Roberto on 12/9/21.
//

import Foundation

struct EventModel: Codable, Identifiable {
    var id: Int = 0
    var title: String = "Test"
    var description: String = "This is an event"
    var eventCreator: UserModel
}
