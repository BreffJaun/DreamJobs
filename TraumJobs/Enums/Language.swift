//
//  Language.swift
//  TraumJobs
//
//  Created by Jeff Braun on 11.08.25.
//

import Foundation

enum Language: String, CaseIterable, Identifiable {
    case english = "English"
    case german = "German"
    case spanish = "Spanish"
    case french = "French"
    
    var id: String { rawValue }
}
