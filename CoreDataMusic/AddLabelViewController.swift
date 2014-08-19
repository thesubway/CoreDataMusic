//
//  AddLabelViewController.swift
//  CoreDataMusic
//
//  Created by Dan Hoang on 8/19/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import UIKit
import CoreData

protocol AddLabelDelegate {
    func labelAdded()
}

class AddLabelViewController: UIViewController {

    var myContext : NSManagedObjectContext!
    @IBOutlet var labelNameField: UITextField!
    //not have?
    var delegate : AddLabelDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        var appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        self.myContext = appDelegate.managedObjectContext
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveLabelPressed(sender: AnyObject) {
        var newLabel = NSEntityDescription.insertNewObjectForEntityForName("Label", inManagedObjectContext: self.myContext) as Label //since we have the subclasses, instead of NS...
        newLabel.name = self.labelNameField.text
        var error : NSError?
        self.myContext.save(&error) //fill the error logs? Want to know location.
        if error != nil {
            println(error?.localizedDescription)
        }
        else {
            self.delegate?.labelAdded()
            self.navigationController.popToRootViewControllerAnimated(true)
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
