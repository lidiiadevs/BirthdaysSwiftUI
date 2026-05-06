//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Lidiia Diachkovskaia on 5/6/26.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self) //think of it as a list of friends - blueprint how the model should be saved
        }
    }
}
