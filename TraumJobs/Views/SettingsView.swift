//
//  SettingsView.swift
//  TraumJobs
//
//  Created by Jeff Braun on 11.08.25.
//

import SwiftUI

//struct SettingsView: View {
//    @AppStorage(ASKeys.username.rawValue) private var username = ""
//    @AppStorage(ASKeys.userEmail.rawValue) private var userEmail = ""
//    @AppStorage(ASKeys.age.rawValue) private var age = ""
//    @AppStorage(ASKeys.birthDate.rawValue) private var birthDate = Date.distantPast
//    @AppStorage(ASKeys.city.rawValue) private var city = ""
//    
//    @State private var showingAppSettingsSheet = false
//        
//    var body: some View {
//            NavigationView {
//                Form {
//                    if hasAnyData {
//                        Section(header: Text("User Information")) {
//                            if !username.isEmpty {
//                                HStack {
//                                    Text("Username")
//                                    Spacer()
//                                    Text(username).foregroundStyle(.secondary)
//                                }
//                            }
//                            if !userEmail.isEmpty {
//                                HStack {
//                                    Text("Email")
//                                    Spacer()
//                                    Text(userEmail).foregroundStyle(.secondary)
//                                }
//                            }
//                            if !age.isEmpty {
//                                HStack {
//                                    Text("Age")
//                                    Spacer()
//                                    Text(age).foregroundStyle(.secondary)
//                                }
//                            }
//                            // only display if not default
//                            if birthDate != Date.distantPast {
//                                HStack {
//                                    Text("Birthdate")
//                                    Spacer()
//                                    Text(birthDate, style: .date)
//                                        .foregroundStyle(.secondary)
//                                }
//                            }
//                            if !city.isEmpty {
//                                HStack {
//                                    Text("City")
//                                    Spacer()
//                                    Text(city).foregroundStyle(.secondary)
//                                }
//                            }
//                        }
//                    } else {
//                        VStack(spacing: 12) {
//                            Image(systemName: "person.crop.circle.badge.plus")
//                                .font(.largeTitle)
//                                .foregroundColor(.blue)
//                            Text("Bitte gib deine Userdaten ein")
//                                .foregroundColor(.secondary)
//                        }
//                        .frame(maxWidth: .infinity, minHeight: 120)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 12)
//                                .stroke(style: StrokeStyle(lineWidth: 2, dash: [6]))
//                                .foregroundColor(.blue.opacity(0.5))
//                        )
//                        .padding(.vertical, 20)
//                    }
//                }
//                .navigationTitle("Settings")
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        Button {
//                            showingAppSettingsSheet = true
//                        } label: {
//                            Image(systemName: "pencil.circle")
//                        }
//                    }
//                }
//                .sheet(isPresented: $showingAppSettingsSheet) {
//                    AppSettingsSheet()
//                }
//            }
//        }
//        
//        private var hasAnyData: Bool {
//            !username.isEmpty || !userEmail.isEmpty || !age.isEmpty || birthDate != Date.distantPast || !city.isEmpty
//        }
//}

struct SettingsView: View {
    @AppStorage(ASKeys.username.rawValue) private var username = ""
    @AppStorage(ASKeys.userEmail.rawValue) private var userEmail = ""
    @AppStorage(ASKeys.age.rawValue) private var age = ""
    @AppStorage(ASKeys.birthDate.rawValue) private var birthDate: Date?   // ⬅️ jetzt optional
    @AppStorage(ASKeys.city.rawValue) private var city = ""
    
    @State private var showingAppSettingsSheet = false
    
    var body: some View {
        NavigationView {
            Form {
                if hasAnyUserData {
                    Section(header: Text("User Information")) {
                        if !username.isEmpty {
                            HStack {
                                Text("Username")
                                Spacer()
                                Text(username).foregroundStyle(.secondary)
                            }
                        }
                        
                        if !userEmail.isEmpty {
                            HStack {
                                Text("Email")
                                Spacer()
                                Text(userEmail).foregroundStyle(.secondary)
                            }
                        }
                        
                        if !age.isEmpty {
                            HStack {
                                Text("Age")
                                Spacer()
                                Text(age).foregroundStyle(.secondary)
                            }
                        }
                        
                        if let birthDate, !Calendar.current.isDateInToday(birthDate) {
                            HStack {
                                Text("Birthdate")
                                Spacer()
                                Text(birthDate, style: .date)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        
                        
                        if !city.isEmpty {
                            HStack {
                                Text("City")
                                Spacer()
                                Text(city).foregroundStyle(.secondary)
                            }
                        }
                    }
                } else {
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
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAppSettingsSheet = true
                    } label: {
                        Image(systemName: "pencil.circle")
                    }
                }
            }
            .sheet(isPresented: $showingAppSettingsSheet) {
                AppSettingsSheet()
            }
        }
    }
    
    private var hasAnyUserData: Bool {
        !username.isEmpty
        || !userEmail.isEmpty
        || !age.isEmpty
        || (birthDate != nil && !Calendar.current.isDateInToday(birthDate!))
        || !city.isEmpty
    }
    
}


//#Preview {
//    SettingsView()
//}
