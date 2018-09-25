//
//  TableViewController.swift
//  one-app
//
//  Created by Sunny Feng on 8/23/18.
//  Copyright © 2018 HackRU. All rights reserved.
//

import UIKit

class EventsTableViewController: UITableViewController {

    var messages = [Event]()
    var cellText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Call for data
        EventsAPI.apiCall { (eventArr) in
            self.messages = eventArr
            DispatchQueue.main.async {
                self.loadTable()
            }
        }

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
        return messages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = messages[indexPath.row].description
        cell.detailTextLabel?.text = messages[indexPath.row].dateToString(date: messages[indexPath.row].startDate)
        cell.detailTextLabel?.textColor = ColorHexParser().UIColorFromHex(rgbValue: 0x0000A0, alpha: 1)
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "gottenCellInfo") {
            //if let cell = sender as? UITableViewCell,
                //let indexPath = tableView.indexPath(for: cell) {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                //let vc = segue.destination as? EventInfoTableViewController
                //vc?.event = messages[indexPath.row]
                let event = messages[indexPath.row]
                EventInfoTableViewController.mutArr.removeAllObjects()
                EventInfoTableViewController.mutArr.add("Description: \(event.description)")
                EventInfoTableViewController.mutArr.add("Location: \(event.location)")
                EventInfoTableViewController.mutArr.add("Start: \(event.dateToString(date: (event.startDate)))")
                EventInfoTableViewController.mutArr.add("End: \(event.dateToString(date: (event.endDate)))")
            }
        }
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

}
