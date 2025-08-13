//
//  JobsFavoriteView.swift
//  TraumJobs
//
//  Created by Jeff Braun on 13.08.25.
//

import SwiftUI
import SwiftData

struct JobsFavoriteView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.colorScheme) var colorScheme
    
    @Query(
        filter: #Predicate<Job> { $0.isFavorite == true },
        sort: \Job.publicationDate,
        order: .reverse
    )
    private var jobs: [Job]

    
    @State private var showAddJobSheet: Bool = false
    @State private var didLoadDummyData = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                (colorScheme == .light
                 ? Color(.systemGray5)
                 : Color(.systemGray6))
                .ignoresSafeArea()
                
                List {
                    ForEach(jobs) { job in
                        NavigationLink {
                            JobDetailView(job: job)
                        } label: {
                            JobListItemView(job: job)
                        }
                        .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                deleteJob(job: job)
                            } label: {
                                Image(systemName: "trash")
                            }
                            
                            Button {
                                toggleFavorite(job: job)
                            } label: {
                                Image(systemName: job.isFavorite ? "star.fill" : "star")
                            }
                            .tint(job.isFavorite ? .yellow : .gray)
                        }
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .background(colorScheme == .light ? Color(.systemGray5) : Color(.systemGray6))
            }
            .navigationTitle("Favorite Jobs")
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
    
    private func toggleFavorite(job: Job) {
        job.isFavorite.toggle()
        do {
            try context.save()
        } catch {
            print("Error saving favorite status: \(error)")
        }
    }
    
    private func deleteJob(job: Job) {
        context.delete(job)
        do {
            try context.save()
        } catch {
            print("Error deleting job: \(error)")
        }
    }
}

//#Preview {
//    JobsFavoriteView()
//}




