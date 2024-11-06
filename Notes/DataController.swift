//
//  DataController.swift
//  Notes
//
//  Created by Ishaaq Ahmed on 04/11/2024.
//

import CoreData
import Foundation


class DataController: ObservableObject{
    
    var container = NSPersistentContainer(name: "Notes")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
    }
}
