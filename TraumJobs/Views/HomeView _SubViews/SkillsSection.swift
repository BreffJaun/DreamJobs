//
//  SkillsSection.swift
//  TraumJobs
//
//  Created by Jeff Braun on 17.08.25.
//

import SwiftUI

struct SkillsSection: View {
    var skills: [Skill]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("My Skills")
                .font(.headline)
                .padding(.leading, 12)
            
            if skills.isEmpty {
                HStack {
                    Text("You have not yet selected any skills.")
                        .foregroundStyle(.secondary)
                    Spacer()
                }
                .padding(.leading, 12)
            } else {
                ScrollView(.vertical) {
                    let columns = [GridItem(.adaptive(minimum: 80), spacing: 8)]
                    
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 8) {
                        ForEach(skills) { skill in
                            Text(skill.title)
                                .font(.subheadline)
                                .lineLimit(1)
                                .truncationMode(.tail)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(color(for: skill.relevance).opacity(0.3))
                                .foregroundColor(color(for: skill.relevance))
                                .clipShape(Capsule())
                        }
                    }
                }
                .frame(maxHeight: 200)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
        .cornerRadius(12)
    }
    
    // Farbe nach Relevance
    private func color(for relevance: Int) -> Color {
        switch relevance {
        case 1: return .purple
        case 2: return .pink
        case 3: return .orange
        case 4: return .green
        case 5: return .blue
        default: return .gray
        }
    }

}


