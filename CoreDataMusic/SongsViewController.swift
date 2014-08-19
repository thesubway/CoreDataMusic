//
//  SongsViewController.swift
//  CoreDataMusic
//
//  Created by Dan Hoang on 8/19/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import UIKit
import CoreData

class SongsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, AddSongDelegate  {

    var selectedArtist : Artist?
    var songs = [Song]()
    var myContext : NSManagedObjectContext!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.songs = self.selectedArtist!.songs.allObjects as [Song]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func AddSongPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("AddSong", sender: self)
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.songs.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("SongCell", forIndexPath: indexPath) as UITableViewCell
        var song = self.songs[indexPath.row]
        cell.textLabel.text = song.name
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "AddSong" {
            var addSongVC = segue.destinationViewController as AddSongViewController
            addSongVC.selectedArtist = selectedArtist
        }
    }
    
    func songAdded() {
        var request = NSFetchRequest(entityName: "Song")
        var error : NSError?
        self.songs = self.myContext.executeFetchRequest(request, error: &error) as [Song]
        
        if error != nil {
            println(error?.localizedDescription)
        } else {
            self.tableView.reloadData()
        }
    }
    
}
