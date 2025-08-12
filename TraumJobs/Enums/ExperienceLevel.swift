//
//  ExperienceLevel.swift
//  TraumJobs
//
//  Created by Jeff Braun on 12.08.25.
//

import Foundation

enum ExperienceLevel: String, CaseIterable, Identifiable {
    case entryLevel = "Entrylevel"
    case experiened = "Experienced"
    case senior = "Senior"
    case leadership = "Leadership"
    
    var id: String { rawValue }
}
