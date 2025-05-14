//
//  RemindersApp.swift
//  Reminders
//
//  Created by Sravya Kaki on 5/13/25.
//

import SwiftUI

@main
struct RemindersApp: App {
    let viewContext = CoreDataManager.shared.persistentContainer.viewContext
    var body: some Scene {
        WindowGroup {
            HomeScreen().environment(\.managedObjectContext, viewContext)
        }
    }
}
