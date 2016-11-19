//
//  NoteManagedObject+CoreDataProperties.swift
//  PersistenceLayer
//
//  Created by tonyguan on 2016/11/3.
//  Copyright © 2016年 关东升. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

extension NoteManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteManagedObject> {
        return NSFetchRequest<NoteManagedObject>(entityName: "Note");
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var content: String?

}
