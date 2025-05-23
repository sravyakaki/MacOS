//
//  CoreDataManager.swift
//  Reminders
//
//  Created by Sravya Kaki on 5/13/25.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    private init() {
        
        ValueTransformer.setValueTransformer(NSColorTransformer(), forName: NSValueTransformerName("NSColorTransformer"))
        
        persistentContainer = NSPersistentContainer(name: "RemindersModel")
        persistentContainer.loadPersistentStores { description, error in
           if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
    }
}
