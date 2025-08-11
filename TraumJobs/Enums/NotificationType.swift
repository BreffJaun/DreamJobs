//
//  NotificationType.swift
//  TraumJobs
//
//  Created by Jeff Braun on 11.08.25.
//

import Foundation

enum NotificationType: String, CaseIterable, Identifiable {
    case marketing = "Marketing"
    case updates = "Updates"
    case reminders = "Reminders"
    
    var id: String { rawValue }
}
