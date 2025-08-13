//
//  Job.swift
//  TraumJobs
//
//  Created by Jeff Braun on 11.08.25.
//

import Foundation
import SwiftData


@Model
class Job: Identifiable {
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
    @Relationship var requiredSkills: [Skill] = [] // defines an automatically managed link to SEVERAL skill objects.
    var imageData: Data?
    var isFavorite: Bool = false
    
    init(
        title: String,
        details: String,
        requiredSkills: [Skill],
        location: String,
        salary: Double,
        companyName: String,
        workModel: WorkModel,
        experienceLevel: ExperienceLevel,
        publicationDate: Date,
        applicationDeadline: Date? = nil,
        imageData: Data? = nil
    ) {
        self.title = title
        self.details = details
        self.requiredSkills = requiredSkills
        self.location = location
        self.salary = salary
        self.companyName = companyName
        self.workModel = workModel
        self.experienceLevel = experienceLevel
        self.publicationDate = publicationDate
        self.applicationDeadline = applicationDeadline
        self.imageData = imageData
    }
    
    func toggleFavorite() {
        isFavorite.toggle()
    }
    
//    func markAsFavorite() {
//        isFavorite = true
//    }
//    
//    func removeFromFavorites() {
//        isFavorite = false
//    }
    
    func apply() {
        // later...
    }
}


