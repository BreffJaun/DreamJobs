//
//  DataManager.swift
//  TraumJobs
//
//  Created by Jeff Braun on 18.08.25.
//

import Foundation
import SwiftData

class DataManager {
    private init() {}
    
    // MARK: - Produktiver Container
    static let container: ModelContainer = {
        do {
            return try ModelContainer(for: Favorite.self, Job.self, Skill.self)
        } catch {
            fatalError("❌ Failed to configure SwiftData ModelContainer: \(error)")
        }
    }()
    
    // MARK: - Preview Container (für SwiftUI Previews)
    @MainActor
    static let previewContainer: ModelContainer = {
        do {
            let container = try ModelContainer(
                for: Favorite.self, Job.self, Skill.self,
                configurations: ModelConfiguration(isStoredInMemoryOnly: true)
            )
            
            let context = container.mainContext
            
            // 👉 Dummy-Skills & Jobs einfügen
//            dummySkills.forEach { context.insert($0) }
            dummyJobs.forEach { context.insert($0) }
            
            return container
            
        } catch {
            fatalError("❌ Failed to configure SwiftData Preview ModelContainer: \(error)")
        }
    }()
}

