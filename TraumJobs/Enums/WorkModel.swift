//
//  WorkModel.swift
//  TraumJobs
//
//  Created by Jeff Braun on 12.08.25.
//

import Foundation

enum WorkModel: String, CaseIterable, Identifiable {
    case fullTime = "Fulltime"
    case partTime = "Parttime"
    case Remote = "Remote"
    case hybrid = "Hybrid"
    
    var id: String { rawValue }
}
