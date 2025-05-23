//
//  NSColorTransformer.swift
//  Reminders
//
//  Created by Sravya Kaki on 5/14/25.
//

import Foundation
import AppKit

class NSColorTransformer: ValueTransformer {
    
    override func transformedValue(_ value: Any?) -> Any? {
        guard let color = value as? NSColor else { return nil }
        
        do {
         let data =  try  NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
            return data
        } catch {
            return nil
        }
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil}
        
        do {
            let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: NSColor.self, from: data)
            return color
        } catch {
            return nil
        }
    }
    
}
