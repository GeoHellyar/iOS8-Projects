//
//  FeedItem.swift
//  exchangeAGram
//
//  Created by Brad Hellyar on 11/8/14.
//  Copyright (c) 2014 SixAxis. All rights reserved.
//

import Foundation
import CoreData

@objc (FeedItem)
class FeedItem: NSManagedObject {

    @NSManaged var caption: String
    @NSManaged var image: NSData

}
