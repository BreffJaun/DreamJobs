//
//  Skill.swift
//  TraumJobs
//
//  Created by Jeff Braun on 12.08.25.
//

import Foundation
import SwiftData


@Model
class Skill: Identifiable {
    var id: UUID = UUID()
    var title: String
    var details: String
    var category: SkillCategory
    var relevance: Int
    @Relationship(inverse: \Job.requiredSkills) var jobs: [Job] = []
    
    init(
        title: String,
        details: String,
        category: SkillCategory,
        relevance: Int
    ) {
        self.title = title
        self.details = details
        self.category = category
        self.relevance = relevance
    }
}
