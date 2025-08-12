//
//  JobDetailView.swift
//  TraumJobs
//
//  Created by Jeff Braun on 12.08.25.
//

import SwiftUI

import SwiftUI

struct JobDetailView: View {
    let job: Job
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(job.title)
                .font(.headline)
            
            Text(job.companyName)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(job.location)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text("Salary: \(job.salary, specifier: "%.2f") €")
                .font(.subheadline)
            
            Text("Work model: \(job.workModel.rawValue)")
                .font(.subheadline)
            
            Text("Experience: \(job.experienceLevel.rawValue)")
                .font(.subheadline)
            
            if let deadline = job.applicationDeadline {
                Text("Application deadline: \(deadline.formatted(date: .numeric, time: .omitted))")
                    .font(.footnote)
                    .foregroundColor(.red)
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}


//#Preview {
//    JobDetailView()
//}
