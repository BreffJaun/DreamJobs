//
//  WorkModel.swift
//  TraumJobs
//
//  Created by Jeff Braun on 12.08.25.
//

import Foundation

enum WorkModel: String, CaseIterable, Identifiable, Codable {
    case fullTime = "Fulltime"
    case partTime = "Parttime"
    case remote = "Remote"
    case hybrid = "Hybrid"
    
    var id: String { rawValue }
}
