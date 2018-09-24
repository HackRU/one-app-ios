//
//  TableViewController.swift
//  one-app
//
//  Created by Sunny Feng on 8/23/18.
//  Copyright © 2018 HackRU. All rights reserved.
//

import UIKit

<<<<<<< HEAD:one-app-ios/event-schedule/TableViewController.swift
class TableViewController: UITableViewController {

    var messages = [TextAndTs]()
    var cellText = ""

    @IBOutlet var table: UITableView!

=======
class EventsTableViewController: UITableViewController {

    var messages = [Event]()
    var cellText = ""

    @IBOutlet var table: UITableView!
    
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
>>>>>>> event-schedule:one-app-ios/event-schedule/EventsTableViewController.swift
    override func viewDidLoad() {
        super.viewDidLoad()

        table.delegate = self
        table.dataSource = self

        // Call for data
<<<<<<< HEAD:one-app-ios/event-schedule/TableViewController.swift
       InfoAPI.apiCall { (textArr) in
            self.messages = textArr
        DispatchQueue.main.async {
            self.loadTable()
=======
        EventsAPI.apiCall { (eventArr) in
            self.messages = eventArr
            DispatchQueue.main.async {
                self.loadTable()
            }
>>>>>>> event-schedule:one-app-ios/event-schedule/EventsTableViewController.swift
        }
            print(self.messages)
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
        cell.detailTextLabel?.text = messages[indexPath.row].stringDate(date: messages[indexPath.row].startDate)

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "gottenCellInfo") {
            if let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPath(for: cell) {
                let vc = segue.destination as? ViewController
                vc?.message = (messages[indexPath.row]).toString()
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
