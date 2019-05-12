//
//  AddTripViewController.swift
//  OnTheRoadAgain
//
//  Created by Jaeson Booker on 5/12/19.
//  Copyright © 2019 Jaeson Booker. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {
    var tripController = TripTableViewController()
    @IBOutlet weak var tripTextField: UITextField!
    @IBAction func addTripButton(_ sender: Any) {
        let trip = Trip()
        if tripTextField.text != nil {
            trip.name = tripTextField.text!
            tripController.tripArray.append(trip)
            tripController.tableView.reloadData()
            navigationController?.popViewController(animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
