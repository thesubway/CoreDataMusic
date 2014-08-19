//
//  ArtistsViewController.swift
//  CoreDataMusic
//
//  Created by Dan Hoang on 8/19/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import UIKit
import CoreData

class ArtistsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedLabel : Label?
    var artists = [Artist]()
    var myContext : NSManagedObjectContext!
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.artists = self.selectedLabel!.artists.allObjects as [Artist]
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addArtistPressed(sender: AnyObject) {
        
        self.performSegueWithIdentifier("AddArtist", sender: self)
        
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.artists.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("ArtistCell", forIndexPath: indexPath) as UITableViewCell
        var artist = self.artists[indexPath.row]
        cell.textLabel.text = artist.firstName
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "AddArtist" {
            var addArtistVC = segue.destinationViewController as AddArtistViewController
            addArtistVC.selectedLabel = selectedLabel
        }
        else if segue.identifier == "ShowSong" {
            var songsVC = segue.destinationViewController as SongsViewController
            songsVC.selectedArtist = self.artists[self.tableView.indexPathForSelectedRow().row]
        }
    }
}
