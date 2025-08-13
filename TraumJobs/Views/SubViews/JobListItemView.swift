//
//  JobListItemView.swift
//  TraumJobs
//
//  Created by Jeff Braun on 13.08.25.
//

import SwiftUI

struct JobListItemView: View {
    @Environment(\.colorScheme) private var colorScheme
    let job: Job
    
    var body: some View {
        HStack(spacing: 12) {
            if let data = job.imageData, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 80, height: 80)
                    .overlay(
                        Image(systemName: "briefcase.fill")
                            .foregroundColor(.gray)
                    )
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(job.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text("\(job.companyName) • \(job.location) • \(job.workModel.rawValue)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Veröffentlicht: \(job.publicationDate.formatted(date: .numeric, time: .omitted))")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                if let deadline = job.applicationDeadline {
                    Text("Bewerbungsfrist: \(deadline.formatted(date: .numeric, time: .omitted))")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 150, alignment: .leading)
        .background(colorScheme == .light ? Color.white : Color(.systemGray5))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.08), radius: 3, x: 0, y: 1)
    }
}


//#Preview {
//    JobListItemView()
//}
