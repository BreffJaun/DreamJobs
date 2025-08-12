//
//  MainTabView.swift
//  TraumJobs
//
//  Created by Jeff Braun on 11.08.25.
//

import SwiftUI

struct TabBarView: View {
//    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        
        
        TabView {
            Tab("Settings", systemImage: "house.fill") {
                SettingsView()
            }
            
            Tab("Jobs", systemImage: "suitcase.fill") {
                JobsView()
            }
            
            Tab("Favorites", systemImage: "star.fill") {
                
            }
            
            Tab("Skills", systemImage: "sparkles") {
                
            }
        }
    }
}

#Preview {
    TabBarView()
        .modelContainer(for: [
            Favorite.self,
            Job.self,
            Skill.self
        ], inMemory: true)
}
