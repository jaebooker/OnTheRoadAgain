//
//  WayPointsViewController.swift
//  OnTheRoadAgain
//
//  Created by Jaeson Booker on 5/12/19.
//  Copyright © 2019 Jaeson Booker. All rights reserved.
//

import UIKit

class WayPointsViewController: UIViewController {
    var tripController = TripTableViewController()
    var selectedTrip = Trip()
    @IBOutlet weak var wayPointLabel: UILabel!
    @IBAction func wayPointButton(_ sender: Any) {
    }
    @IBAction func removeTripButton(_ sender: Any) {
        for tripSelected in tripController.tripArray {
            if tripSelected.name == selectedTrip.name {
                print("found")
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        wayPointLabel.text = selectedTrip.name
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
