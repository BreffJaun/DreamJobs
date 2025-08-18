//
//  MainTabView.swift
//  TraumJobs
//
//  Created by Jeff Braun on 11.08.25.
//

import SwiftUI

struct TabBarView: View {

    var body: some View {
        
        
        TabView {
            Tab("Home", systemImage: "house.fill") {
                HomeView()
            }
            
            Tab("Jobs", systemImage: "suitcase.fill") {
                JobsView()
            }
            
            Tab("Favorites", systemImage: "star.fill") {
                JobsFavoriteView()
            }
            
            Tab("Skills", systemImage: "sparkles") {
                SkillsViewSet()
            }
        }
    }
}

#Preview {
    TabBarView()
//        .modelContainer(for: [
//            Favorite.self,
//            Job.self,
//            Skill.self
//        ], inMemory: true)
        .modelContainer(DataManager.previewContainer)
}
