//
//  JobAddView.swift
//  TraumJobs
//
//  Created by Jeff Braun on 12.08.25.
//

import SwiftUI
import SwiftData

struct JobsView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.colorScheme) var colorScheme
    
    @State private var showAddJobSheet: Bool = false
    
    @Query(sort: \Job.publicationDate, order: .reverse) private var jobs: [Job]
    @State private var didLoadDummyData = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                (colorScheme == .light
                 ? Color(.systemGray5)
                 : Color(.systemGray6))
                .ignoresSafeArea()
                
                ScrollView {
                    ForEach(jobs) { job in
                        NavigationLink {
                            JobDetailView(job: job)
                        } label: {
                            JobListItemView(job: job)
                        }
                        .buttonStyle(.plain)
                        
                        // MARK: Swipe Action
                        .swipeActions(edge: .trailing) {
                            Button {
                                job.toggleFavorite()
                                try? context.save()
                            } label: {
                                Label(job.isFavorite ? "Unfavorite" : "Favorite",
                                      systemImage: job.isFavorite ? "star.slash.fill" : "star.fill")
                            }
                            .tint(job.isFavorite ? .gray : .yellow)
                        }
            }
                }
                .padding()

            }
            .navigationTitle("Jobs")
            .onAppear {
                loadDummyJobsIfNeeded()
            }
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
    
    private func loadDummyJobsIfNeeded() {
        guard !didLoadDummyData else { return }
        if jobs.isEmpty {
            for job in dummyJobs {
                context.insert(job)
            }
            didLoadDummyData = true
        }
    }
    
    private func jobIsFavorite(_ job: Job) -> Bool {
        return job.isFavorite
    }

    private func toggleFavorite(job: Job) {
        job.isFavorite.toggle()
        
        do {
            try context.save()
        } catch {
            print("Error when saving: \(error)")
        }
    }

}

//#Preview {
//    JobAddView()
//}
