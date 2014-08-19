//
//  AddSongViewController.swift
//  CoreDataMusic
//
//  Created by Dan Hoang on 8/19/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import UIKit
import CoreData

protocol AddSongDelegate {
    func songAdded()
}

class AddSongViewController: UIViewController {

    var myContext : NSManagedObjectContext!
    var selectedArtist : Artist?
    
    @IBOutlet var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveSongPressed(sender: AnyObject) {
        var artistContext = self.selectedArtist?.managedObjectContext
        var newSong = NSEntityDescription.insertNewObjectForEntityForName("Song", inManagedObjectContext: artistContext) as Song
        newSong.name = nameField.text
        newSong.artist = self.selectedArtist!
        var error : NSError?
        artistContext?.save(&error)
        if error != nil {
            println(error?.localizedDescription)
        }
    }
}
