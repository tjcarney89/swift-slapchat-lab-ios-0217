//
//  SlapChatTests.swift
//  SlapChatTests
//
//  Created by Johann Kerr on 12/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import XCTest
import CoreData
@testable import SlapChat

class SlapChatTests: XCTestCase {
    
    var store: DataStore!
    
    override func setUp() {
        super.setUp()
        store = DataStore.sharedInstance
        deleteAll(entity: "Message")
    }
    
    
    override func tearDown() {
        super.tearDown()
        store = nil
    }
    
    func testFetchData() {
        store.fetchData()
        XCTAssertEqual(store.messages.count, 0)
        
        let msg1 = Message(context: store.persistentContainer.viewContext)
        msg1.content = "Testing Message"
        msg1.createdAt = NSDate()
        store.saveContext()
        
        store.fetchData()
        XCTAssertEqual(store.messages.count, 1)
        
        
    }
    
    func testGenerateTestData() {
        let vc = TableViewController()
        vc.generateTestData()
        XCTAssert(store.messages.count > 0)
    }
    
    
    func deleteAll(entity: String) {
        let context = store.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        
        do {
            let items = try context.fetch(fetchRequest)
            
            for item in items {
                let managedObj = item as! NSManagedObject
                context.delete(managedObj)
            }
        } catch {
            
        }
        
    }
}
