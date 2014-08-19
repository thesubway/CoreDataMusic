//
//  AddArtistViewController.swift
//  CoreDataMusic
//
//  Created by Dan Hoang on 8/19/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import UIKit
import CoreData

class AddArtistViewController: UIViewController {
    
    var myContext : NSManagedObjectContext!
    var selectedLabel : Label?
    
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        
        var labelContext = self.selectedLabel?.managedObjectContext
        
        var newArtist = NSEntityDescription.insertNewObjectForEntityForName("Artist", inManagedObjectContext: labelContext) as Artist
        newArtist.firstName = self.firstNameField.text
        newArtist.lastName = self.lastNameField.text
        newArtist.label = self.selectedLabel!
        var error : NSError?
        labelContext?.save(&error)
        if error != nil {
            println(error?.localizedDescription)
        }
    }
    
    
}