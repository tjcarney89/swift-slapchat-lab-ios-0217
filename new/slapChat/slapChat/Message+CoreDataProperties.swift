//
//  Message+CoreDataProperties.swift
//  SlapChat
//
//  Created by Ian Rahman on 11/7/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Message {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Message> {
        return NSFetchRequest<Message>(entityName: "Message");
    }

    @NSManaged public var content: String?
    @NSManaged public var createdAt: NSDate?

}
