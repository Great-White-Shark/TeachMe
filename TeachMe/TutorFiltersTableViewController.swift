//
//  TutorFiltersTableViewController.swift
//  TeachMe
//
//  Created by Clover on 9/22/15.
//  Copyright (c) 2015 Great White Shark. All rights reserved.
//

import UIKit

class TutorFiltersTableViewController: UITableViewController {

    @IBOutlet weak var nameInputTextField: UITextField!
    @IBOutlet weak var genderImageView: UIImageView!
    
    var isMale: Bool?
    
    override func viewWillDisappear(animated: Bool) {
        navigationItem.title = "Tutor Filters"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        print(isMale)
        if indexPath.section == 0 && indexPath.row == 3 {
            if isMale == nil {
                isMale = false
                genderImageView.image = UIImage(named: "StarFull")
                print(isMale)
            }
                
            else if isMale == false {
                isMale = true
                genderImageView.image = UIImage(named: "StarEmpty")
            }
                
            else if isMale == true {
                isMale = nil
                genderImageView.image = nil
            }
        }
    }
    
    @IBAction func onCancelButton(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onDone(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        navigationItem.title = ""
        
        if segue.identifier == "UniversityFilter" {
            let subjectFilterViewController = segue.destinationViewController as! CheckFilterTypeViewController
            subjectFilterViewController.filterBasedOn = 0
        }
            
        else if segue.identifier == "MajorFilter" {
            let subjectFilterViewController = segue.destinationViewController as! CheckFilterTypeViewController
            subjectFilterViewController.filterBasedOn = 1
        }
            
        else if segue.identifier == "SubjectFilter" {
            let subjectFilterViewController = segue.destinationViewController as! CheckFilterTypeViewController
            subjectFilterViewController.filterBasedOn = 2
            
        }
    }
    
//    func addGenderSwitch() -> DGRunkeeperSwitch {
//        let runkeeperSwitch = DGRunkeeperSwitch(leftTitle: "M", rightTitle: "F")
//        runkeeperSwitch.backgroundColor = UIColor(red: 98.0/255.0, green: 156.0/255.0, blue: 68.0/255.0, alpha: 1.0)
//        runkeeperSwitch.selectedBackgroundColor = .whiteColor()
//        runkeeperSwitch.titleColor = .whiteColor()
//        runkeeperSwitch.selectedTitleColor = UIColor(red: 98.0/255.0, green: 156.0/255.0, blue: 68.0/255.0, alpha: 1.0)
//        runkeeperSwitch.titleFont = UIFont(name: "HelveticaNeue-Medium", size: 13.0)
//        runkeeperSwitch.frame = CGRect(x: 0, y: 0, width: 50.0, height: 30.0)
//        runkeeperSwitch.addTarget(self, action: Selector("switchValueDidChange:"), forControlEvents: .ValueChanged)
//        return runkeeperSwitch
//    }
    
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell
    
    // Configure the cell...
    
    return cell
    }
    */
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
}
