//
//  AddTripViewController.swift
//  OnTheRoadAgain
//
//  Created by Jaeson Booker on 5/12/19.
//  Copyright © 2019 Jaeson Booker. All rights reserved.
//

import UIKit
import AVFoundation
class AddTripViewController: UIViewController {
    var tripController = TripTableViewController()
    var addTripPlayer = AVAudioPlayer()
    @IBOutlet weak var tripTextField: UITextField!
    @IBAction func addTripButton(_ sender: Any) {
//        let trip = Trip()
//        if tripTextField.text != nil {
//            trip.name = tripTextField.text!
//            tripController.tripArray.append(trip)
//            tripController.tableView.reloadData()
//            navigationController?.popViewController(animated: true)
//        }
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newTrip = TripItem(entity: TripItem.entity(), insertInto: context)
            if tripTextField.text != nil {
                newTrip.name = tripTextField.text!
            }
            try? context.save()
            navigationController?.popViewController(animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addTripPlayer.play()
        let addTripSound = Bundle.main.path(forResource: "addTripSound", ofType: "mp3")
        do {
            addTripPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: addTripSound!))
        } catch {
            print(error)
        }
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
