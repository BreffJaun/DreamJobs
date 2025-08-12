//
//  SkillCategory.swift
//  TraumJobs
//
//  Created by Jeff Braun on 12.08.25.
//

import Foundation

enum SkillCategory: String, CaseIterable, Identifiable {
    case technical = "Technical"
    case language = "Language"
    case social = "Social"
    case management = "Management"
    case creative = "Creative"
    case analytical = "Analytical"
    case physical = "Physical"
    case scientific = "Scientific"
    case customerService = "Customer Service"
    case financial = "Financial"
    
    var id: String { rawValue }
}
