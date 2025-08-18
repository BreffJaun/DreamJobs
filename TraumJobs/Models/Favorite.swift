//
//  Favorites.swift
//  TraumJobs
//
//  Created by Jeff Braun on 12.08.25.
//

import Foundation
import SwiftData

@Model
class Favorite {
    var id: String = UUID().uuidString
    var userId: String
    @Relationship var jobIds: [Job] = []
    
    init(userId: String) {
        self.userId = userId
    }
    
}
