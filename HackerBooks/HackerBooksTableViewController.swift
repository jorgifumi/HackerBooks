//
//  HackerBooksTableViewController.swift
//  HackerBooks
//
//  Created by Jorge Miguel Lucena Pino on 11/12/15.
//  Copyright © 2015 Jorge Miguel Lucena Pino. All rights reserved.
//

import UIKit

class HackerBooksTableViewController: UITableViewController {
    
    let model : KCLibrary? = KCLibrary(strictBooksArray: decodeJSON())
    
    @IBOutlet weak var sortType: UISegmentedControl!
    
    @IBAction func switchSort() {
        self.tableView.reloadData()
    }
    
    var sortByTitle : Bool{
        get{
            return sortType.selectedSegmentIndex == 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sortType.selectedSegmentIndex = 1
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if sortByTitle {
            return 1
        }else{
            return model?.tagsCount ?? 0
        }
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if sortByTitle {
            return model?.booksCount ?? 0
        }else{
            return (model?.bookCountForTag(KCBookTag(withName: (model?.tags[section].tagName)!)))!
        }
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if sortByTitle{
            return nil
        }else{
            return model?.tags[section].tagName
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("KCBookCell", forIndexPath: indexPath)
        let book : KCBook?
        
        if sortType.selectedSegmentIndex == 0 {
            book = model?.books[indexPath.row]
        }else{
            book = model?.bookAtIndex(indexPath.item, tag: KCBookTag(withName: (model?.tags[indexPath.section].tagName)!))
        }
  
        cell.textLabel?.text = book?.title
        //cell.imageView?.image = UIImage(contentsOfFile: book?.image)
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
