//
//  ExperienceLevel.swift
//  TraumJobs
//
//  Created by Jeff Braun on 12.08.25.
//

import Foundation

enum ExperienceLevel: String, CaseIterable, Identifiable, Codable {
    case entryLevel = "Entrylevel"
    case experienced = "Experienced"
    case senior = "Senior"
    case leadership = "Leadership"
    
    var id: String { rawValue }
}
