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
    
//    var body: some View {
//        ScrollView {
//            VStack(spacing: 20) {
//                // Header
//                Text("Job Details")
//                    .font(.title)
//                    .bold()
//                    .padding(.top)
//                
//                // Info Card
//                VStack(alignment: .leading, spacing: 16) {
//                    // Bild
//                    if let data = job.imageData, let uiImage = UIImage(data: data) {
//                        Image(uiImage: uiImage)
//                            .resizable()
//                            .scaledToFill()
//                            .frame(height: 180)
//                            .clipped()
//                            .cornerRadius(12)
//                            .shadow(radius: 3)
//                    }
//                    
//                    detailRow(label: "Title", systemImage: "briefcase.fill", value: job.title)
//                    detailRow(label: "Company", systemImage: "building.2.fill", value: job.companyName, secondary: true)
//                    detailRow(label: "Location", systemImage: "mappin.and.ellipse", value: job.location, secondary: true)
//                    detailRow(label: "Salary", systemImage: "eurosign.circle.fill", value: "\(String(format: "%.0f", job.salary)) €")
//                    detailRow(label: "Work Model", systemImage: "laptopcomputer.and.iphone", value: job.workModel.rawValue)
//                    detailRow(label: "Experience", systemImage: "person.fill.checkmark", value: job.experienceLevel.rawValue)
//                    
//                    if let deadline = job.applicationDeadline {
//                        Divider()
//                        HStack {
//                            Label("Application Deadline", systemImage: "calendar.badge.exclamationmark")
//                                .font(.headline)
//                            Spacer()
//                            Text(deadline.formatted(date: .long, time: .omitted))
//                                .foregroundColor(.red)
//                        }
//                    }
//                    
//                    if !job.details.isEmpty {
//                        Divider()
//                        Text("Description")
//                            .font(.headline)
//                        Text(job.details)
//                            .font(.body)
//                            .foregroundColor(.primary)
//                            .multilineTextAlignment(.leading)
//                    }
//                }
//                .padding()
//                .background(colorScheme == .light ? Color(.systemBackground) : Color(.secondarySystemBackground))
//                .cornerRadius(16)
//                .shadow(radius: 4)
//                .padding(.horizontal)
//            }
//        }
//    }
//    
//    private func detailRow(label: String, systemImage: String, value: String, secondary: Bool = false) -> some View {
//        HStack {
//            Label(label, systemImage: systemImage)
//                .font(.headline)
//            Spacer()
//            Text(value)
//                .font(.body)
//                .foregroundColor(secondary ? .secondary : .primary)
//        }
//    }
    var body: some View {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Job Details")
                        .font(.title)
                        .bold()
                        .padding(.top)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        // Bild
                        if let data = job.imageData, let uiImage = UIImage(data: data) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 180)
                                .clipped()
                                .cornerRadius(12)
                                .shadow(radius: 3)
                        }
                        
                        // Favorit-Status
                        HStack {
                            Label(job.isFavorite ? "Favorite" : "No Favorit",
                                  systemImage: job.isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(job.isFavorite ? .red : .gray)
                            Spacer()
                            Button {
                                job.toggleFavorite()
                                try? context.save()
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
                            detailRow(label: "Deadline", systemImage: "calendar.badge.exclamationmark", value: deadline.formatted(date: .long, time: .omitted), secondary: true)
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
                        try? context.save()
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
        
        private func detailRow(label: String, systemImage: String, value: String, secondary: Bool = false) -> some View {
            HStack {
                Label(label, systemImage: systemImage)
                    .font(.headline)
                Spacer()
                Text(value)
                    .font(.body)
                    .foregroundColor(secondary ? .secondary : .primary)
            }
        }
}


//#Preview {
//    JobDetailView()
//}
