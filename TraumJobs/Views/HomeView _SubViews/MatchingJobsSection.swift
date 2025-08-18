//
//  MatchingJobsSection.swift
//  TraumJobs
//
//  Created by Jeff Braun on 17.08.25.
//

import SwiftUI
struct MatchingJobsSection: View {
    var jobs: [Job]
    var userSkills: [Skill]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Suitable jobs")
                .font(.headline)
                .padding(.leading, 12)
            
            if jobs.isEmpty {
                HStack {
                    Text("No matching jobs found.")
                        .foregroundStyle(.secondary)
                    Spacer()
                }
                .padding(.leading, 12)
            } else {
                ForEach(jobs) { job in
                    let matchingCount = job.requiredSkills.filter { userSkills.contains($0) }.count
                    
                    NavigationLink(destination: JobDetailView(job: job)) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(job.title)
                                    .font(.subheadline).bold()
                                    .foregroundColor(.white)
                                Text("\(matchingCount) matching skills out of \(job.requiredSkills.count)")
                                    .font(.caption)
                                    .foregroundColor(Color.white.opacity(0.8))
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white.opacity(0.8))
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 16)
                        .background(
                            LinearGradient(
                                colors: [Color.blue, Color.purple],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
        .cornerRadius(12)
    }
}


//#Preview {
//    MatchingJobsSection()
//}
