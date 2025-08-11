//
//  SettingsView.swift
//  TraumJobs
//
//  Created by Jeff Braun on 11.08.25.
//

import SwiftUI

struct SettingsView: View {
    
    @FocusState private var focus: UserInfoFocus?

    @AppStorage(ASKeys.username.rawValue) private var username = ""
    @AppStorage(ASKeys.userEmail.rawValue) private var userEmail = ""
    @AppStorage(ASKeys.age.rawValue) private var age = ""
    @AppStorage(ASKeys.birthDate.rawValue) private var birthDate = Date()
    @AppStorage(ASKeys.city.rawValue) private var city = ""
    @AppStorage(ASKeys.notificationsEnabled.rawValue) private var notificationsEnabled = false
    
    @State private var showingAppSettingsSheet = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User")) {
                    TextField("Username", text: $username)
                        .focused($focus, equals: .name)
                    TextField("Email", text: $userEmail)
                        .focused($focus, equals: .email)
                        .keyboardType(.emailAddress)
                    TextField("Age", text: $age)
                        .focused($focus, equals: .age)
                        .keyboardType(.numberPad)
                    DatePicker("Birthdate", selection: $birthDate, displayedComponents: .date)
                        .focused($focus, equals: .birthdate)
                    TextField("City", text: $city)
                        .focused($focus, equals: .city)
                }
                
                Section {
                    Button(action: {
                        showingAppSettingsSheet = true
                    }) {
                        Text("Open App Settings")
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.blue)
                    }
                }
            }
            .navigationTitle("User Information")
            .sheet(isPresented: $showingAppSettingsSheet) {
                AppSettingsSheet()
            }
            .onSubmit {
                switch focus {
                case .name:
                    focus = .email
                case .email:
                    focus = .age
                case .age:
                    focus = .city
                case .city:
                    focus = nil
                default:
                    break
                }
            }
        }
    }
}



//#Preview {
//    SettingsView()
//}
