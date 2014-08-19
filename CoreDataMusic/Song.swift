//
//  Song.swift
//  CoreDataMusic
//
//  Created by Dan Hoang on 8/19/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import Foundation
import CoreData

class Song: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var year: NSNumber
    @NSManaged var artist: NSManagedObject //now it has a pointer to its artist

}
