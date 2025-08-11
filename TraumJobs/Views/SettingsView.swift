//
//  SettingsView.swift
//  TraumJobs
//
//  Created by Jeff Braun on 11.08.25.
//

import SwiftUI

struct SettingsView: View {

    @AppStorage("username") private var username = ""
    @AppStorage("userEmail") private var userEmail = ""
    @AppStorage("age") private var age = ""
    @AppStorage("birthDate") private var birthDate = Date()
    @AppStorage("city") private var city = ""
    @AppStorage("notificationsEnabled") private var notificationsEnabled = false
    
    @State private var showingAppSettingsSheet = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User")) {
                    TextField("Username", text: $username)
                    TextField("Email", text: $userEmail)
                        .keyboardType(.emailAddress)
                    TextField("Age", text: $age)
                        .keyboardType(.numberPad)
                    DatePicker("Birthdate", selection: $birthDate, displayedComponents: .date)
                    TextField("City", text: $city)
                }
                
                Section {
                    Button("Open App Settings") {
                        showingAppSettingsSheet = true
                    }
                }
            }
            .navigationTitle("Settings")
            .sheet(isPresented: $showingAppSettingsSheet) {
                AppSettingsSheet()
            }
        }
    }
}



//#Preview {
//    SettingsView()
//}
