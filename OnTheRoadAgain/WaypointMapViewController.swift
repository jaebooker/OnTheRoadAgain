//
//  WaypointMapViewController.swift
//  OnTheRoadAgain
//
//  Created by Jaeson Booker on 5/14/19.
//  Copyright © 2019 Jaeson Booker. All rights reserved.
//

import UIKit
import MapKit
class WaypointMapViewController: UIViewController {
    var selectedWaypoint: WaypointItem? = nil
    @IBOutlet weak var mapView: MKMapView!
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
