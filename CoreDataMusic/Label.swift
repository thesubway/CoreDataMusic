//
//  Label.swift
//  CoreDataMusic
//
//  Created by Dan Hoang on 8/19/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import Foundation
import CoreData

class Label: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var artists: NSSet

}
