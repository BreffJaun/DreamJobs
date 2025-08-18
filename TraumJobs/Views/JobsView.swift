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
    
    @Query(sort: \Job.publicationDate, order: .reverse) private var jobs: [Job]
    @Query private var skills: [Skill]
    
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
                                context.delete(job)
                            } label: {
                                Image(systemName: "trash")
                            }
                            
                            Button {
                                job.isFavorite.toggle()
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
