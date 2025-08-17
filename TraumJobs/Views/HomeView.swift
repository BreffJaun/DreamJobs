//
//  SettingsView.swift
//  TraumJobs
//
//  Created by Jeff Braun on 11.08.25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    // MARK: - AppStorage
    @AppStorage(ASKeys.username.rawValue) private var username = ""
    @AppStorage(ASKeys.userEmail.rawValue) private var userEmail = ""
    @AppStorage(ASKeys.birthDate.rawValue) private var birthDate: Date?
    @AppStorage(ASKeys.city.rawValue) private var city = ""
    @AppStorage(ASKeys.userSkills.rawValue) private var userSkillIDsData: Data = Data()
    
    // MARK: - Queries
    @Query private var skills: [Skill]
    @Query private var jobs: [Job]
    
    // MARK: - State
    @State private var showingAppSettingsSheet = false
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // MARK: - User Profile
                    ProfileCard(
                        username: username,
                        email: userEmail,
                        city: city,
                        birthDate: validBirthDate
                    )
                    
                    // MARK: - Skills Section
                    SkillsSection(skills: userSkills)

                    
                    // MARK: - Matching Jobs
                    MatchingJobsSection(jobs: matchingJobs, userSkills: userSkills)
                    
                }
                .padding()
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAppSettingsSheet = true
                    } label: {
                        Image(systemName: "pencil.circle")
                    }
                }
            }
            .sheet(isPresented: $showingAppSettingsSheet) {
                AppSettingsSheet()
            }
        }
    }
    
    // MARK: - Computed Properties
    private var userSkills: [Skill] {
        guard let decoded = try? JSONDecoder().decode(Set<UUID>.self, from: userSkillIDsData) else {
            return []
        }
        return skills.filter { decoded.contains($0.id) }
    }
    
    private var matchingJobs: [Job] {
        jobs
            .filter { job in
                !job.requiredSkills.isEmpty &&
                job.requiredSkills.contains(where: { userSkills.contains($0) })
            }
            .sorted { job1, job2 in
                let matches1 = job1.requiredSkills.filter { userSkills.contains($0) }.count
                let matches2 = job2.requiredSkills.filter { userSkills.contains($0) }.count
                return matches1 > matches2
            }
    }

    
    private var validBirthDate: Date? {
        guard let birthDate else { return nil }
        let defaultDate = Calendar.current.date(byAdding: .year, value: -18, to: Date())!
        return Calendar.current.isDate(birthDate, inSameDayAs: defaultDate) ? nil : birthDate
    }
    
}


//#Preview {
//    HomeView()
//}

