//
//  SettingsView.swift
//  TraumJobs
//
//  Created by Jeff Braun on 11.08.25.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("username") private var username = ""
    @AppStorage("age") private var age = ""
    
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Enter your username", text: $username)
                .padding(10)
                            .background(Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.white, lineWidth: 1)
                            )
            TextField("Enter your age", text: $age)
                .keyboardType(.numberPad)
                .padding(10)
                .background(Color.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.white, lineWidth: 1)
                )
            Button("Save") {
                
            }
//            } label: {
//                Label("Save", systemImage: "tray.and.arrow.down")
//            }
        }
        .padding()
    }
}

//#Preview {
//    SettingsView()
//}
