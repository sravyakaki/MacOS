//
//  MyListsViewModel.swift
//  Reminders
//
//  Created by Sravya Kaki on 5/14/25.
//

import Foundation
import SwiftUI
import CoreData

class MyListsViewModel: NSObject, ObservableObject {
    
    @Published var myLists = [MyListViewModel]()
    private let fetchResultsController: NSFetchedResultsController<MyList>
    private var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        
        self.context = context
        fetchResultsController = NSFetchedResultsController(fetchRequest: MyList.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fetchResultsController.delegate = self
        
        fetchAll()
    }
    
    private func fetchAll() {
        do {
            try  fetchResultsController.performFetch()
            guard let myLists = fetchResultsController.fetchedObjects else {
                return
            }
                self.myLists = myLists.map(MyListViewModel.init)
            
        } catch {
            print(error)
        }
    }
}


extension MyListsViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let myLists = controller.fetchedObjects as? [MyList] else {
            return
        }
        
        self.myLists = myLists.map(MyListViewModel.init)
    }
}
