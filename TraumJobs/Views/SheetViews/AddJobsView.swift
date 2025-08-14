//
//  AddJobsSheet.swift
//  TraumJobs
//
//  Created by Jeff Braun on 12.08.25.
//

import SwiftUI
import SwiftData
import PhotosUI

struct AddJobsView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @Query(sort: \Skill.title) private var allSkills: [Skill]
    
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
    @State private var selectedSkills: [Skill] = []
    
    // MARK: Everything beongs to the ImagePicker
    @State private var selectedImageData: Data?
    @State private var showImagePicker: Bool = false
    @State private var selectedItem: PhotosPickerItem? = nil
    
    
    
    
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
            
            Section(header: Text("Skills")) {
                Menu {
                    ForEach(allSkills) { skill in
                        Button {
                            if !selectedSkills.contains(skill) {
                                selectedSkills.append(skill)
                            }
                        } label: {
                            Text(skill.title)
                        }
                    }
                } label: {
                    HStack {
                        Text("Add Skill")
                        Spacer()
                        Image(systemName: "plus.circle")
                            .foregroundColor(.blue)
                    }
                }

                if selectedSkills.isEmpty {
                    Text("No skills selected yet")
                        .foregroundColor(.secondary)
                } else {
                    ForEach(selectedSkills) { skill in
                        Text(skill.title)
                            .swipeActions {
                                Button(role: .destructive) {
                                    if let index = selectedSkills.firstIndex(of: skill) {
                                        selectedSkills.remove(at: index)
                                    }
                                } label: {
                                    Label("Remove", systemImage: "trash")
                                }
                            }
                    }
                }
            }
            
            Section(header: Text("Company Logo")) {
                if let data = selectedImageData, let uiImage = UIImage(data: data) {
                    HStack {
                        Spacer()
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 150)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                }
                
                PhotosPicker("Select Image", selection: $selectedItem, matching: .images)
                    .onChange(of: selectedItem) { _, newItem in
                        Task {
                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                selectedImageData = data
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.blue)
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
            requiredSkills: selectedSkills,
            location: location,
            salary: salaryValue,
            companyName: companyName,
            workModel: workModel,
            experienceLevel: experienceLevel,
            publicationDate: publicationDate,
            applicationDeadline: applicationDeadline,
            imageData: selectedImageData,
            isFavorite: false
        )
        
        context.insert(newJob)
        
        // Reset the form
        title = ""
        details = ""
        selectedSkills = []
        location = ""
        salary = ""
        companyName = ""
        workModel = .fullTime
        experienceLevel = .entryLevel
        publicationDate = Date()
        applicationDeadline = nil
        hasApplicationDeadline = false
        selectedImageData = nil
        
        dismiss()
    }
}


//#Preview {
//    AddJobsView()
//}
