//
//  DummyJobs.swift
//  TraumJobs
//
//  Created by Jeff Braun on 13.08.25.
//

import Foundation

//let dummyJobs: [Job] = [
//    Job(
//        title: "iOS Developer",
//        details: "Entwicklung moderner iOS-Apps mit SwiftUI und SwiftData.",
//        requiredSkills: [],
//        location: "Berlin",
//        salary: 60000,
//        companyName: "Apple GmbH",
//        workModel: .hybrid,
//        experienceLevel: .experienced,
//        publicationDate: Date()
//    ),
//    Job(
//        title: "Backend Engineer",
//        details: "Entwicklung skalierbarer Serverlösungen mit Node.js und Swift.",
//        requiredSkills: [],
//        location: "München",
//        salary: 65000,
//        companyName: "Tech Solutions",
//        workModel: .remote,
//        experienceLevel: .senior,
//        publicationDate: Date()
//    ),
//    Job(
//        title: "UI/UX Designer",
//        details: "Erstellung von Designsystemen und Interfaces für mobile Apps.",
//        requiredSkills: [],
//        location: "Hamburg",
//        salary: 55000,
//        companyName: "Design Studio",
//        workModel: .fullTime,
//        experienceLevel: .entryLevel,
//        publicationDate: Date()
//    ),
//    Job(
//        title: "Fullstack Developer",
//        details: "Entwicklung von Web- und Mobile-Lösungen in Swift und React.",
//        requiredSkills: [],
//        location: "Frankfurt",
//        salary: 70000,
//        companyName: "Innovatech",
//        workModel: .hybrid,
//        experienceLevel: .senior,
//        publicationDate: Date()
//    )
//]
//falsetrue


let dummyJobs: [Job] = [
    Job(
        title: "iOS Developer",
        details: "Entwicklung moderner iOS-Apps mit SwiftUI und SwiftData.",
        requiredSkills: [
            Skill(title: "Swift", details: "Programmierung von iOS-Apps mit Swift.", category: .technical, relevance: 5),
            Skill(title: "SwiftUI", details: "UI-Entwicklung mit SwiftUI.", category: .technical, relevance: 4),
            Skill(title: "Xcode", details: "Arbeiten mit Apples Entwicklungsumgebung.", category: .technical, relevance: 3)
        ],
        location: "Berlin",
        salary: 60000,
        companyName: "Apple GmbH",
        workModel: .hybrid,
        experienceLevel: .experienced,
        publicationDate: Date(),
        applicationDeadline: Calendar.current.date(byAdding: .day, value: 30, to: Date()),
        isFavorite: true
    ),
    Job(
        title: "Backend Engineer",
        details: "Entwicklung skalierbarer Serverlösungen mit Node.js und Swift.",
        requiredSkills: [
            Skill(title: "Node.js", details: "Serverentwicklung mit Node.js.", category: .technical, relevance: 5),
            Skill(title: "API Design", details: "Architektur und Design von Schnittstellen.", category: .analytical, relevance: 4),
            Skill(title: "SQL-Datenbanken", details: "Arbeiten mit relationalen Datenbanken.", category: .technical, relevance: 4)
        ],
        location: "München",
        salary: 65000,
        companyName: "Tech Solutions",
        workModel: .remote,
        experienceLevel: .senior,
        publicationDate: Date(),
        applicationDeadline: Calendar.current.date(byAdding: .day, value: 45, to: Date()),
        isFavorite: true
    ),
    Job(
        title: "UI/UX Designer",
        details: "Erstellung von Designsystemen und Interfaces für mobile Apps.",
        requiredSkills: [
            Skill(title: "Figma", details: "Prototyping und Design mit Figma.", category: .creative, relevance: 5),
            Skill(title: "Prototyping", details: "Erstellung klickbarer Prototypen.", category: .creative, relevance: 4),
            Skill(title: "Usability Testing", details: "Nutzerfreundlichkeit von Apps testen.", category: .analytical, relevance: 3)
        ],
        location: "Hamburg",
        salary: 55000,
        companyName: "Design Studio",
        workModel: .fullTime,
        experienceLevel: .entryLevel,
        publicationDate: Date(),
        applicationDeadline: Calendar.current.date(byAdding: .day, value: 20, to: Date()),
        isFavorite: true
    ),
    Job(
        title: "Projektmanager",
        details: "Koordination von Softwareprojekten und Stakeholder-Management.",
        requiredSkills: [
            Skill(title: "Agile Methoden", details: "Scrum und Kanban anwenden.", category: .management, relevance: 5),
            Skill(title: "Kommunikation", details: "Effektive Kommunikation im Team.", category: .social, relevance: 4),
            Skill(title: "Projektplanung", details: "Zeit- und Ressourcenplanung.", category: .management, relevance: 4)
        ],
        location: "Köln",
        salary: 65000,
        companyName: "PM Solutions",
        workModel: .fullTime,
        experienceLevel: .experienced,
        publicationDate: Date(),
        applicationDeadline: Calendar.current.date(byAdding: .day, value: 40, to: Date()),
        isFavorite: true
    ),
    Job(
        title: "Data Scientist",
        details: "Analyse großer Datenmengen und Entwicklung von Machine Learning Modellen.",
        requiredSkills: [
            Skill(title: "Python", details: "Datenanalyse und Machine Learning.", category: .technical, relevance: 5),
            Skill(title: "Statistik", details: "Analyse statistischer Daten.", category: .analytical, relevance: 5),
            Skill(title: "Machine Learning", details: "Erstellung und Training von ML-Modellen.", category: .scientific, relevance: 4)
        ],
        location: "Düsseldorf",
        salary: 72000,
        companyName: "DataWorks",
        workModel: .remote,
        experienceLevel: .senior,
        publicationDate: Date(),
        applicationDeadline: Calendar.current.date(byAdding: .day, value: 50, to: Date()), isFavorite: false
    ),
    Job(
        title: "Customer Support Specialist",
        details: "Unterstützung von Kunden bei technischen und administrativen Fragen.",
        requiredSkills: [
            Skill(title: "Kommunikation", details: "Freundliche und klare Kommunikation.", category: .customerService, relevance: 5),
            Skill(title: "Problemlösung", details: "Lösungen für Kundenanfragen finden.", category: .analytical, relevance: 4),
            Skill(title: "CRM Systeme", details: "Arbeiten mit Kundenverwaltungssystemen.", category: .technical, relevance: 3)
        ],
        location: "Leipzig",
        salary: 40000,
        companyName: "Support GmbH",
        workModel: .fullTime,
        experienceLevel: .entryLevel,
        publicationDate: Date(),
        applicationDeadline: Calendar.current.date(byAdding: .day, value: 25, to: Date()), isFavorite: false
    ),
    Job(
        title: "Marketing Manager",
        details: "Entwicklung und Umsetzung von Marketingkampagnen.",
        requiredSkills: [
            Skill(title: "SEO/SEM", details: "Optimierung von Online-Marketing Maßnahmen.", category: .technical, relevance: 4),
            Skill(title: "Kreativität", details: "Entwicklung innovativer Marketingideen.", category: .creative, relevance: 5),
            Skill(title: "Projektmanagement", details: "Kampagnen planen und koordinieren.", category: .management, relevance: 4)
        ],
        location: "Stuttgart",
        salary: 58000,
        companyName: "MarketGurus",
        workModel: .hybrid,
        experienceLevel: .experienced,
        publicationDate: Date(),
        applicationDeadline: Calendar.current.date(byAdding: .day, value: 35, to: Date()),
        isFavorite: true
    ),
    Job(
        title: "Fitness Trainer",
        details: "Individuelle Trainingspläne erstellen und betreuen.",
        requiredSkills: [
            Skill(title: "Personal Training", details: "Trainingsprogramme für Kunden entwickeln.", category: .physical, relevance: 5),
            Skill(title: "Motivation", details: "Kunden zu regelmäßigen Workouts motivieren.", category: .social, relevance: 4),
            Skill(title: "Ernährungsberatung", details: "Tipps für gesunde Ernährung geben.", category: .scientific, relevance: 3)
        ],
        location: "München",
        salary: 42000,
        companyName: "FitLife",
        workModel: .fullTime,
        experienceLevel: .entryLevel,
        publicationDate: Date(),
        applicationDeadline: Calendar.current.date(byAdding: .day, value: 15, to: Date()),
        isFavorite: false
    )
]
