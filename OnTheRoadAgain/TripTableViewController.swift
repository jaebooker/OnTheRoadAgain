//
//  TripTableViewController.swift
//  OnTheRoadAgain
//
//  Created by Jaeson Booker on 5/12/19.
//  Copyright © 2019 Jaeson Booker. All rights reserved.
//

import UIKit
import AVFoundation
class TripTableViewController: UITableViewController {
    var tripArray: [Trip] = []
    var tripMusicPlayer = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        tripArray = testTripCreation()
        let tripMusic = Bundle.main.path(forResource: "sendMeOnMyWay", ofType: "mp3")
        do {
            tripMusicPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: tripMusic!))
        } catch {
            print(error)
        }
        tripMusicPlayer.play()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func testTripCreation() -> [Trip] {
        var cocomo = Trip()
        cocomo.name = "Brumuda, Jamaca"
        var floridaKeys = Trip()
        floridaKeys.name = "Oooh, I wanna take ya!"
        return [cocomo, floridaKeys]
    }
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tripArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        var trips = tripArray[indexPath.row]
        cell.textLabel?.text = trips.name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var trips = tripArray[indexPath.row]
        performSegue(withIdentifier: "ViewTripSegue", sender: trips)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addTripVC = segue.destination as? AddTripViewController {
            addTripVC.tripController = self
        }
        if let viewTripVC = segue.destination as? WayPointsViewController {
            
            if let tripSelected = sender as? Trip {
                viewTripVC.tripController = self
                viewTripVC.selectedTrip = tripSelected
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
