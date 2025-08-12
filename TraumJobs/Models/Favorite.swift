//
//  Favorites.swift
//  TraumJobs
//
//  Created by Jeff Braun on 12.08.25.
//

import Foundation
import SwiftData

class Favorite {
    var id: String = UUID().uuidString
    var userId: String
    @Relationship var jobIds: [Job] = []
    
    init(userId: String) {
        self.userId = userId
    }
    
    func addFavorite(jobId: String) {
        if !jobIds.contains(where: { $0.id == jobId }) {
            if let job = findJob(by: jobId) {
                jobIds.append(job)
            }
        }
    }
    
    func removeFavorite(jobId: String) {
        jobIds.removeAll { $0.id == jobId }
    }
    
    func getFavorites() -> [Job] {
        return jobIds
    }
    
    private func findJob(by id: String) -> Job? {
        return nil // Platzhalter
    }
}
