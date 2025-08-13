//
//  DummyJobs.swift
//  TraumJobs
//
//  Created by Jeff Braun on 13.08.25.
//

import Foundation

let dummyJobs: [Job] = [
    Job(
        title: "iOS Developer",
        details: "Entwicklung moderner iOS-Apps mit SwiftUI und SwiftData.",
        requiredSkills: [],
        location: "Berlin",
        salary: 60000,
        companyName: "Apple GmbH",
        workModel: .hybrid,
        experienceLevel: .experienced,
        publicationDate: Date()
    ),
    Job(
        title: "Backend Engineer",
        details: "Entwicklung skalierbarer Serverlösungen mit Node.js und Swift.",
        requiredSkills: [],
        location: "München",
        salary: 65000,
        companyName: "Tech Solutions",
        workModel: .remote,
        experienceLevel: .senior,
        publicationDate: Date()
    ),
    Job(
        title: "UI/UX Designer",
        details: "Erstellung von Designsystemen und Interfaces für mobile Apps.",
        requiredSkills: [],
        location: "Hamburg",
        salary: 55000,
        companyName: "Design Studio",
        workModel: .fullTime,
        experienceLevel: .entryLevel,
        publicationDate: Date()
    ),
    Job(
        title: "Fullstack Developer",
        details: "Entwicklung von Web- und Mobile-Lösungen in Swift und React.",
        requiredSkills: [],
        location: "Frankfurt",
        salary: 70000,
        companyName: "Innovatech",
        workModel: .hybrid,
        experienceLevel: .senior,
        publicationDate: Date()
    )
]



