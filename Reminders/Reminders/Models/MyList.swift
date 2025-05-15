//
//  MyList.swift
//  Reminders
//
//  Created by Sravya Kaki on 5/13/25.
//

import Foundation
import CoreData
import AppKit

@objc(MyList)
class MyList: NSManagedObject, BaseModel {
    
    static var all: NSFetchRequest<MyList> {
        let request: NSFetchRequest<MyList> = MyList.fetchRequest()
        request.sortDescriptors =  []
        return request
    }
}

extension MyList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyList> {
        return NSFetchRequest<MyList>(entityName: "MyList")
    }

    @NSManaged public var color: NSColor?
    @NSManaged public var name: String?

}

extension MyList : Identifiable {

}
