//
//  JobDetailView.swift
//  TraumJobs
//
//  Created by Jeff Braun on 12.08.25.
//

import SwiftUI

//struct JobDetailView: View {
//    @Environment(\.colorScheme) private var colorScheme
//    let job: Job
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 12) {
//            if let data = job.imageData, let uiImage = UIImage(data: data) {
//                Image(uiImage: uiImage)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(height: 150)
//                    .clipped()
//                    .cornerRadius(12)
//            }
//            
//            Text(job.title)
//                .font(.headline)
//            
//            Text(job.companyName)
//                .font(.subheadline)
//                .foregroundColor(.secondary)
//            
//            Text(job.location)
//                .font(.subheadline)
//                .foregroundColor(.secondary)
//            
//            Text("Salary: \(job.salary, specifier: "%.2f") €")
//                .font(.subheadline)
//            
//            Text("Work model: \(job.workModel.rawValue)")
//                .font(.subheadline)
//            
//            Text("Experience: \(job.experienceLevel.rawValue)")
//                .font(.subheadline)
//            
//            if let deadline = job.applicationDeadline {
//                Text("Application deadline: \(deadline.formatted(date: .numeric, time: .omitted))")
//                    .font(.footnote)
//                    .foregroundColor(.red)
//            }
//        }
//        .padding()
//        .frame(maxWidth: .infinity, alignment: .leading) // ganze Breite
//        .background(colorScheme == .light ? Color.white : Color(.systemGray5))
//        .cornerRadius(16)
//        .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 2)
//        .padding(.horizontal)
//    }
//}


struct JobDetailView: View {
    @Environment(\.colorScheme) private var colorScheme
    let job: Job
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                Text("Job Details")
                    .font(.title)
                    .bold()
                    .padding(.top)
                
                // Info Card
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
                    
                    detailRow(label: "Title", systemImage: "briefcase.fill", value: job.title)
                    detailRow(label: "Company", systemImage: "building.2.fill", value: job.companyName, secondary: true)
                    detailRow(label: "Location", systemImage: "mappin.and.ellipse", value: job.location, secondary: true)
                    detailRow(label: "Salary", systemImage: "eurosign.circle.fill", value: "\(String(format: "%.0f", job.salary)) €")
                    detailRow(label: "Work Model", systemImage: "laptopcomputer.and.iphone", value: job.workModel.rawValue)
                    detailRow(label: "Experience", systemImage: "person.fill.checkmark", value: job.experienceLevel.rawValue)
                    
                    if let deadline = job.applicationDeadline {
                        Divider()
                        HStack {
                            Label("Application Deadline", systemImage: "calendar.badge.exclamationmark")
                                .font(.headline)
                            Spacer()
                            Text(deadline.formatted(date: .long, time: .omitted))
                                .foregroundColor(.red)
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
