//
//  ProfileCard.swift
//  TraumJobs
//
//  Created by Jeff Braun on 17.08.25.
//

import SwiftUI
import SwiftData

struct ProfileCard: View {
    let username: String
    let email: String       // <— neu
    let city: String
    let birthDate: Date?

    private var defaultBirthDate: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }

    private var hasRealBirthDate: Bool {
        guard let birthDate else { return false }
        return !Calendar.current.isDate(birthDate, inSameDayAs: defaultBirthDate)
    }

    private var age: Int? {
        guard let birthDate, hasRealBirthDate else { return nil }
        let calendar = Calendar.current
        return calendar.dateComponents([.year], from: birthDate, to: Date()).year
    }

    private var hasAnyUserData: Bool {
        let textDataExists = !username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
                             !city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
                             !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        let realBirthDateExists = hasRealBirthDate
        return textDataExists || realBirthDateExists
    }

    var body: some View {
        Group {
            if hasAnyUserData {
                HStack(alignment: .top, spacing: 16) {
                    // Icon links
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 48))
                        .foregroundStyle(.blue)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        // Username
                        Text(username.isEmpty ? "Unknown User" : username)
                            .font(.title2).bold()
                        
                        // City
                        if !city.isEmpty {
                            Text(city)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        
                        // Email
                        if !email.isEmpty {
                            Text(email)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                                                
                        // Age
                        if let age {
                            Text("Age: \(age)")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        
                        // Birthdate
                        if let birthDate, hasRealBirthDate {
                            Text("Birthdate: \(birthDate, style: .date)")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                    Spacer()
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(12)
            } else {
                // Platzhalter, wenn keine Userdaten vorhanden sind
                VStack(spacing: 12) {
                    Image(systemName: "person.crop.circle.badge.plus")
                        .font(.system(size: 40))
                        .foregroundColor(.secondary)
                    
                    Text("Please enter user data")
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, minHeight: 150)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                        .foregroundColor(.secondary)
                )
                .padding(.vertical, 30)
            }
        }
    }
}


//#Preview {
//    ProfileCard()
//}
