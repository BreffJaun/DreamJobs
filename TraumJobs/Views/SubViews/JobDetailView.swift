//
//  JobDetailView.swift
//  TraumJobs
//
//  Created by Jeff Braun on 12.08.25.
//

import SwiftUI

struct JobDetailView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    let job: Job
    
    var body: some View {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Job Details")
                        .font(.title)
                        .bold()
                        .padding(.top)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        if let data = job.imageData, let uiImage = UIImage(data: data) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 180)
                                .clipped()
                                .cornerRadius(12)
                                .shadow(radius: 3)
                        }
                        
                        HStack {
                            Label(job.isFavorite ? "Favorite" : "No Favorit",
                                  systemImage: job.isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(job.isFavorite ? .red : .gray)
                            Spacer()
                            Button {
                                job.isFavorite.toggle()
                            } label: {
                                Text(job.isFavorite ? "Remove" : "Add")
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        
                        // Details
                        detailRow(label: "Title", systemImage: "briefcase.fill", value: job.title)
                        detailRow(label: "Company", systemImage: "building.2.fill", value: job.companyName, secondary: true)
                        detailRow(label: "Location", systemImage: "mappin.and.ellipse", value: job.location, secondary: true)
                        detailRow(label: "Salary", systemImage: "eurosign.circle.fill", value: "\(String(format: "%.0f", job.salary)) €")
                        detailRow(label: "Work Model", systemImage: "laptopcomputer.and.iphone", value: job.workModel.rawValue)
                        detailRow(label: "Experience", systemImage: "person.fill.checkmark", value: job.experienceLevel.rawValue)
                        detailRow(label: "Published", systemImage: "calendar", value: job.publicationDate.formatted(date: .long, time: .omitted))
                        
                        if let deadline = job.applicationDeadline {
                            detailRow(
                                label: "Deadline",
                                systemImage: "calendar.badge.exclamationmark",
                                value: deadline.formatted(date: .long, time: .omitted),
                                color: .red
                            )
                        }

                        if !job.requiredSkills.isEmpty {
                            Divider()
                            Text("Required Skills")
                                .font(.headline)

                            VStack(alignment: .leading, spacing: 8) {
                                ForEach(job.requiredSkills.sorted(by: { $0.title < $1.title })) { skill in
                                    HStack {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.blue)
                                        VStack(alignment: .leading) {
                                            Text(skill.title)
                                                .font(.body)
                                                .foregroundColor(.primary)
                                            Text(skill.category.rawValue.capitalized)
                                                .font(.caption)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                }
                            }
                        }

                        
                        if !job.details.isEmpty {
                            Divider()
                            Text("Description")
                                .font(.headline)
                            Text(job.details)
                                .font(.body)
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .padding()
                    .background(colorScheme == .light ? Color(.systemBackground) : Color(.secondarySystemBackground))
                    .cornerRadius(16)
                    .shadow(radius: 4)
                    .padding(.horizontal)
                    
                    Button(role: .destructive) {
                        context.delete(job)
                        dismiss()
                    } label: {
                        Label("Delete Job", systemImage: "trash")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                    .padding()
                }
            }
        }
        
    private func detailRow(label: String, systemImage: String, value: String, secondary: Bool = false, color: Color? = nil) -> some View {
        HStack {
            Label(label, systemImage: systemImage)
                .font(.headline)
            Spacer()
            Text(value)
                .font(.body)
                .foregroundColor(color ?? (secondary ? .secondary : .primary)) // << Farbe wählen
        }
    }

}


//#Preview {
//    JobDetailView()
//}
