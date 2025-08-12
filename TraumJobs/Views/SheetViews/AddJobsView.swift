//
//  AddJobsSheet.swift
//  TraumJobs
//
//  Created by Jeff Braun on 12.08.25.
//

import SwiftUI

struct AddJobsView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var details: String = ""
    @State private var location: String = ""
    @State private var salary: String = ""
    @State private var companyName: String = ""
    @State private var workModel: WorkModel = .fullTime
    @State private var experienceLevel: ExperienceLevel = .entryLevel
    @State private var publicationDate: Date = Date()
    @State private var applicationDeadline: Date? = nil
    @State private var tempDeadline: Date = Date()
    @State private var hasApplicationDeadline: Bool = false
    
    
    var body: some View {
        Form {
            Section(header: Text("Job Details")) {
                TextField("Title", text: $title)
                TextField("Details", text: $details)
                TextField("Location", text: $location)
                TextField("Company", text: $companyName)
                TextField("Salary", text: $salary)
                    .keyboardType(.decimalPad)
                
                Picker("Workmodel", selection: $workModel) {
                    ForEach(WorkModel.allCases) { model in
                        Text(model.rawValue).tag(model)
                    }
                }
                
                Picker("Experiencelevel", selection: $experienceLevel) {
                    ForEach(ExperienceLevel.allCases) { level in
                        Text(level.rawValue).tag(level)
                    }
                }
                
                DatePicker("Publication date", selection: $publicationDate, displayedComponents: .date)
                
                Toggle("Add application deadline", isOn: $hasApplicationDeadline)
                
                if hasApplicationDeadline {
                    DatePicker("Application deadline", selection: $tempDeadline, displayedComponents: .date)
                        .onChange(of: tempDeadline) { _, newDate in
                            applicationDeadline = newDate
                        }
                        .onAppear {
                            tempDeadline = applicationDeadline ?? Date()
                        }
                }
            }
            
            Button("Save") {
                saveJob()
            }
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .foregroundStyle(.blue)
        }
    }
    
    func saveJob() {
        guard let salaryValue = Double(salary) else {
            print("Invalid salary")
            return
        }
        
        let newJob = Job(
            title: title,
            details: details,
            requiredSkills: [], // vorerst leer
            location: location,
            salary: salaryValue,
            companyName: companyName,
            workModel: workModel,
            experienceLevel: experienceLevel,
            publicationDate: publicationDate,
            applicationDeadline: applicationDeadline
        )
        
        context.insert(newJob)
        
        // Rset form
        title = ""
        details = ""
        location = ""
        salary = ""
        companyName = ""
        workModel = .fullTime
        experienceLevel = .entryLevel
        publicationDate = Date()
        applicationDeadline = nil
        hasApplicationDeadline = false
        
        dismiss()
    }
}


//#Preview {
//    AddJobsView()
//}
