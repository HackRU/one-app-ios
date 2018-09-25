//
//  EventInfoTableViewController.swift
//  one-app
//
//  Created by Sunny Feng on 9/24/18.
//  Copyright © 2018 HackRU. All rights reserved.
//

import UIKit

class EventInfoTableViewController: UITableViewController {

    public static let mutArr = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadTable()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func loadTable() {
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EventInfoTableViewController.mutArr.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
        cell.textLabel?.text = EventInfoTableViewController.mutArr.object(at: indexPath.row) as? String
        return cell
        /*
        var cell: UITableViewCell
        switch indexPath.row {
        case 0:
            
            cell.textLabel?.text = "Description:" + (event?.description)!
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
            cell.textLabel?.text = "Location: " + (event?.location)!
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "startCell", for: indexPath)
            cell.textLabel?.text = event?.dateToString(date: (event?.startDate)!)
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: "endCell", for: indexPath)
            cell.textLabel?.text = event?.dateToString(date: (event?.endDate)!)
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
            cell.textLabel?.text = "N/A"
        }

        return cell */
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
