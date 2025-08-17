//
//  NotificationTypesSheet.swift
//  TraumJobs
//
//  Created by Jeff Braun on 11.08.25.
//

import SwiftUI

struct AppSettingsSheet: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @AppStorage("appLanguage") private var appLanguageRaw = Language.english.rawValue
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("fontSize") private var fontSize = 14.0
    
    @AppStorage("notificationsEnabled") private var notificationsEnabled = false
    @AppStorage("notificationMarketing") private var notificationMarketing = false
    @AppStorage("notificationUpdates") private var notificationUpdates = false
    @AppStorage("notificationReminders") private var notificationReminders = false
    
    // Userdaten
    @AppStorage(ASKeys.username.rawValue) private var username = ""
    @AppStorage(ASKeys.userEmail.rawValue) private var userEmail = ""
    @AppStorage(ASKeys.birthDate.rawValue) private var birthDate: Date?
    @AppStorage(ASKeys.city.rawValue) private var city = ""
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User Information")) {
                    TextField("Username", text: $username)
                    TextField("Email", text: $userEmail)
                    
                    DatePicker(
                        "Birthdate",
                        selection: Binding(
                            get: { birthDate ?? Calendar.current.date(byAdding: .year, value: -18, to: Date())! },
                            set: { birthDate = $0 }
                        ),
                        in: ...Calendar.current.date(byAdding: .year, value: -18, to: Date())!.endOfDay,
                        displayedComponents: .date
                    )

                    
                    if let date = birthDate, let age = calculateAge(from: date) {
                        HStack {
                            Text("Age")
                            Spacer()
                            Text("\(age)")
                                .foregroundColor(.secondary)
                        }
                    }

                    
                    TextField("City", text: $city)
                }
                
                Section(header: Text("Notifications")) {
                    Toggle("Enable Notifications", isOn: $notificationsEnabled)
                    
                    if notificationsEnabled {
                        Toggle("Marketing", isOn: $notificationMarketing)
                        Toggle("Updates", isOn: $notificationUpdates)
                        Toggle("Reminders", isOn: $notificationReminders)
                    }
                }
                
                Section(header: Text("App Settings")) {
                    Picker("App Language", selection: $appLanguageRaw) {
                        ForEach(Language.allCases) { lang in
                            Text(lang.rawValue).tag(lang.rawValue)
                        }
                    }
                    
                    Toggle("Dark Mode", isOn: $isDarkMode)
                    
//                    VStack(alignment: .leading) {
//                        Text("Font Size: \(Int(fontSize))")
//                        Slider(value: $fontSize, in: 10...30, step: 1)
//                    }
                }
            }
            .navigationTitle("App Settings")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func calculateAge(from birthDate: Date?) -> Int? {
        guard let birthDate else { return nil }
        let calendar = Calendar.current
        let now = Date()
        let ageComponents = calendar.dateComponents([.year], from: birthDate, to: now)
        return ageComponents.year
    }

}

//#Preview {
//    NotificationTypesSheet()
//}
