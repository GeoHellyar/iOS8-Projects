//
//  TaskModel.swift
//  TaskIt
//
//  Created by Brad Hellyar on 11/6/14.
//  Copyright (c) 2014 SixAxis. All rights reserved.
//

import Foundation
import CoreData

@objc(TaskModel)
class TaskModel: NSManagedObject {

    @NSManaged var completed: NSNumber
    @NSManaged var date: NSDate
    @NSManaged var subtask: String
    @NSManaged var task: String

}
