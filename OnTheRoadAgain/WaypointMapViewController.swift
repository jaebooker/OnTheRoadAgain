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
    override func viewWillAppear(_ animated: Bool) {
        if (selectedWaypoint?.lat != nil) && (selectedWaypoint?.long != nil) && (selectedWaypoint?.title != nil) {
            let annotation = MKPointAnnotation()
            annotation.title = selectedWaypoint?.title
            annotation.coordinate = CLLocationCoordinate2DMake(selectedWaypoint!.lat, selectedWaypoint!.long)
            self.mapView.addAnnotation(annotation) //add annotation to mapview
            let span = MKCoordinateSpan(latitudeDelta: 0.1,longitudeDelta: 0.1) //span of zoom
            let region = MKCoordinateRegion(center: annotation.coordinate,span: span) //region for zoom
            self.mapView.setRegion(region, animated: true) //set zoom in
        }
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
