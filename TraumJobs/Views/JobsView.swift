//
//  JobAddView.swift
//  TraumJobs
//
//  Created by Jeff Braun on 12.08.25.
//

import SwiftUI
import SwiftData

struct JobsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var showAddJobSheet: Bool = false
    
    @Query private var jobs: [Job]
    
    var body: some View {
        NavigationStack {
            ZStack {
                (colorScheme == .light
                 ? Color(.systemGray5)
                 : Color(.systemGray6))
                .ignoresSafeArea()
                
                ScrollView {
                    ForEach(jobs) { job in
                        JobDetailView(job: job)
                    }
                }
                .padding()
            }
            .navigationTitle("Jobs")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        AddJobsView()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
        }
    }
}

//#Preview {
//    JobAddView()
//}
