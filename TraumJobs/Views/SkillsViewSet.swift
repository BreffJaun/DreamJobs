//
//  SkillsViewSet.swift
//  TraumJobs
//
//  Created by Jeff Braun on 14.08.25.
//

import SwiftUI
import SwiftData

//struct SkillsViewSet: View {
//    @Environment(\.colorScheme) var colorScheme
//    @Environment(\.modelContext) private var context
//
//    @Query(sort: \Skill.title) private var skills: [Skill]
//
//    @State private var newSkillTitle: String = ""
//    @State private var newSkillDetails: String = ""
//    @State private var newSkillCategory: SkillCategory = .technical
//    @State private var newSkillRelevance: Int = 0
//    @State private var showingAddSkillSheet = false
//
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                (colorScheme == .light
//                 ? Color(.systemGray5)
//                 : Color(.systemGray6))
//                .ignoresSafeArea()
//
//                List {
//                    ForEach(skills) { skill in
//                        VStack(alignment: .leading) {
//                            Text(skill.title).font(.headline)
//                            Text(skill.details).font(.subheadline).foregroundColor(.secondary)
//                            HStack {
//                                Text("Category: \(skill.category.rawValue.capitalized)")
//                                Spacer()
//                                Text("Relevance: \(skill.relevance)")
//                            }.font(.caption)
//                        }
//                        .padding(.vertical, 4)
//                    }
//                }
//                .navigationTitle("Skills")
//                .toolbar {
//                    Button(action: {
//                        showingAddSkillSheet = true
//                    }) {
//                        Image(systemName: "plus")
//                    }
//                }
//                .sheet(isPresented: $showingAddSkillSheet) {
//                    NavigationStack {
//                        Form {
//                            Section(header: Text("Title")) {
//                                TextField("Add Title", text: $newSkillTitle)
//                            }
//
//                            Section(header: Text("Details")) {
//                                TextField("Add Details", text: $newSkillDetails)
//                            }
//
//                            Section(header: Text("Category")) {
//                                Menu {
//                                    ForEach(SkillCategory.allCases) { category in
//                                        Button(action: {
//                                            newSkillCategory = category
//                                        }) {
//                                            Text(category.rawValue.capitalized)
//                                        }
//                                    }
//                                } label: {
//                                    HStack {
//                                        Text("Category")
//                                        Spacer()
//                                        Text(newSkillCategory.rawValue.capitalized)
//                                            .foregroundColor(.secondary)
//                                    }
//                                    .contentShape(Rectangle())
//                                }
//                            }
//
//                            Section(header: Text("Relevance")) {
//                                Stepper("Relevance: \(newSkillRelevance)", value: $newSkillRelevance, in: 0...5)
//                            }
//                        }
//                        .navigationTitle("Add new Skill")
//                        .toolbar {
//                            ToolbarItem(placement: .confirmationAction) {
//                                Button("Add") {
//                                    addSkill()
//                                    showingAddSkillSheet = false
//                                }
//                            }
//                            ToolbarItem(placement: .cancellationAction) {
//                                Button("Cancel") {
//                                    showingAddSkillSheet = false
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//
//    private func addSkill() {
//        let skill = Skill(
//            title: newSkillTitle,
//            details: newSkillDetails,
//            category: newSkillCategory,
//            relevance: newSkillRelevance
//        )
//        context.insert(skill)
//
//        // Felder zurücksetzen
//        newSkillTitle = ""
//        newSkillDetails = ""
//        newSkillCategory = .technical
//        newSkillRelevance = 0
//    }
//}


struct SkillsViewSet: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Skill.title) private var skills: [Skill]
    
    @State private var newSkillTitle: String = ""
    @State private var newSkillDetails: String = ""
    @State private var newSkillCategory: SkillCategory = .technical
    @State private var newSkillRelevance: Int = 0
    @State private var showingAddSkillSheet = false
    
    // MARK: - User Skills
    @AppStorage(ASKeys.userSkills.rawValue) private var userSkillIDsData: Data = Data()
    @State private var userSkillIDs: Set<UUID> = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                (colorScheme == .light
                 ? Color(.systemGray5)
                 : Color(.systemGray6))
                .ignoresSafeArea()
                
                List {
                    ForEach(skills) { skill in
                        VStack(alignment: .leading) {
                            Text(skill.title).font(.headline)
                            Text(skill.details).font(.subheadline).foregroundColor(.secondary)
                            HStack {
                                Text("Category: \(skill.category.rawValue.capitalized)")
                                Spacer()
                                Text("Relevance: \(skill.relevance)")
                            }.font(.caption)
                        }
                        .padding(.vertical, 4)
                        .swipeActions(edge: .trailing) {
                            if userSkillIDs.contains(skill.id) {
                                Button(role: .destructive) {
                                    removeUserSkill(skill)
                                } label: {
                                    Label("Remove", systemImage: "minus.circle")
                                }
                            } else {
                                Button {
                                    addUserSkill(skill)
                                } label: {
                                    Label("Add", systemImage: "plus.circle")
                                }
                                .tint(.green)
                            }
                        }
                    }
                }
                .navigationTitle("Skills")
                .toolbar {
                    Button(action: {
                        showingAddSkillSheet = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $showingAddSkillSheet) {
                    NavigationStack {
                        Form {
                            Section(header: Text("Title")) {
                                TextField("Add Title", text: $newSkillTitle)
                            }
                            
                            Section(header: Text("Details")) {
                                TextField("Add Details", text: $newSkillDetails)
                            }
                            
                            Section(header: Text("Category")) {
                                Menu {
                                    ForEach(SkillCategory.allCases) { category in
                                        Button(action: {
                                            newSkillCategory = category
                                        }) {
                                            Text(category.rawValue.capitalized)
                                        }
                                    }
                                } label: {
                                    HStack {
                                        Text("Category")
                                        Spacer()
                                        Text(newSkillCategory.rawValue.capitalized)
                                            .foregroundColor(.secondary)
                                    }
                                    .contentShape(Rectangle())
                                }
                            }
                            
                            Section(header: Text("Relevance")) {
                                Stepper("Relevance: \(newSkillRelevance)", value: $newSkillRelevance, in: 0...5)
                            }
                        }
                        .navigationTitle("Add new Skill")
                        .toolbar {
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Add") {
                                    addSkill()
                                    showingAddSkillSheet = false
                                }
                            }
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    showingAddSkillSheet = false
                                }
                            }
                        }
                    }
                }
                .onAppear {
                    loadUserSkills()
                }
            }
        }
    }
    
    // MARK: - User Skills Handling
    private func addUserSkill(_ skill: Skill) {
        userSkillIDs.insert(skill.id)
        saveUserSkills()
    }
    
    private func removeUserSkill(_ skill: Skill) {
        userSkillIDs.remove(skill.id)
        saveUserSkills()
    }
    
    private func loadUserSkills() {
        if let decoded = try? JSONDecoder().decode(Set<UUID>.self, from: userSkillIDsData) {
            userSkillIDs = decoded
        }
    }
    
    private func saveUserSkills() {
        if let encoded = try? JSONEncoder().encode(userSkillIDs) {
            userSkillIDsData = encoded
        }
    }
    
    // MARK: - Add Skill to CoreData
    private func addSkill() {
        let skill = Skill(
            title: newSkillTitle,
            details: newSkillDetails,
            category: newSkillCategory,
            relevance: newSkillRelevance
        )
        context.insert(skill)
        
        // Felder zurücksetzen
        newSkillTitle = ""
        newSkillDetails = ""
        newSkillCategory = .technical
        newSkillRelevance = 0
    }
}



//#Preview {
//    SkillsViewSet()
//}
