//
//  Job.swift
//  TraumJobs
//
//  Created by Jeff Braun on 11.08.25.
//

import Foundation
import SwiftData


@Model
class Job {
    var id: String = UUID().uuidString
    var title: String
    var details: String
    var location: String
    var salary: Double
    var companyName: String
    var workModel: WorkModel
    var experienceLevel: ExperienceLevel
    var publicationDate: Date
    var applicationDeadline: Date?
//    @Relationship var requiredSkills: [Skill] = []
    
    
    init(
        title: String,
        details: String,
//        requiredSkills: [Skill],
        location: String,
        salary: Double,
        companyName: String,
        workModel: WorkModel,
        experienceLevel: ExperienceLevel,
        publicationDate: Date,
        applicationDeadline: Date? = nil
    ) {
        self.title = title
        self.details = details
//        self.requiredSkills = requiredSkills
        self.location = location
        self.salary = salary
        self.companyName = companyName
        self.workModel = workModel
        self.experienceLevel = experienceLevel
        self.publicationDate = publicationDate
        self.applicationDeadline = applicationDeadline
    }
    
    func markAsFavorite() {
        // later...
    }
    
    func removeFromFavorites() {
        // later...
    }
    
    func apply() {
        // later...
    }
}


