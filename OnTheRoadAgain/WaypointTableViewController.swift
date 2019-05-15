//
//  WaypointTableViewController.swift
//  OnTheRoadAgain
//
//  Created by Jaeson Booker on 5/14/19.
//  Copyright © 2019 Jaeson Booker. All rights reserved.
//

import UIKit

class WaypointTableViewController: UITableViewController {
    
    var selectedTrip: TripItem? = nil
    var waypointArray: [WaypointItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getWaypointData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
//        getWaypointData()
    }
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return waypointArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "waypointCell", for: indexPath)
        let waypoints = waypointArray[indexPath.row]
        cell.textLabel?.text = waypoints.title
        return cell
    }
    func getWaypointData(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let waypointItems = try? context.fetch(WaypointItem.fetchRequest()) as? [WaypointItem] {
                for i in waypointItems {
                    if i.name == selectedTrip?.name {
                        waypointArray.append(i)
                    }
                }
                tableView.reloadData()
            }
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let waypointy = waypointArray[indexPath.row]
        performSegue(withIdentifier: "viewWaypointSegue", sender: waypointy)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let waypointMapVC = segue.destination as? WaypointMapViewController {
            if let waypointSelected = sender as? WaypointItem {
                waypointMapVC.selectedWaypoint = waypointSelected
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
