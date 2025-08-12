//
//  Skill.swift
//  TraumJobs
//
//  Created by Jeff Braun on 12.08.25.
//

import Foundation
import SwiftData


@Model
class Skill {
    var id: String = UUID().uuidString
    var title: String
    var details: String
    var category: SkillCategory
    var relevance: Int
    
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
