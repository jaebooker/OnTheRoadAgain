//
//  MapViewController.swift
//  OnTheRoadAgain
//
//  Created by Jaeson Booker on 5/12/19.
//  Copyright © 2019 Jaeson Booker. All rights reserved.
//

import UIKit
import MapKit
import AVFoundation
class MapViewController: UIViewController, UISearchBarDelegate {
    
    var wayPoint: Waypoint? = nil
    
    @IBOutlet weak var addWaypointLabel: UIButton!
    
    @IBAction func addWaypointButton(_ sender: Any) {
    }
    
    @IBOutlet weak var mapView: MKMapView!
    var mapPlayer = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
        let mapSound = Bundle.main.path(forResource: "openMap", ofType: "mp3")
        do {
            mapPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: mapSound!))
            mapPlayer.play()
        } catch {
            print(error)
        }
        // Do any additional setup after loading the view.
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        UIApplication.shared.beginIgnoringInteractionEvents() //ignore other activity
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
        
        searchBar.resignFirstResponder() //hide it
        dismiss(animated: true, completion: nil)
        
        let searchRequest = MKLocalSearch.Request() //create search request
        searchRequest.naturalLanguageQuery = searchBar.text
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        activeSearch.start { (respone, error) in
            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            if respone == nil {
                print("error")
            } else {
//                let annotations = self.mapView.annotations
//                self.mapView.removeAnnotation(annotations as! MKAnnotation) //remove annotations
                let latitude = respone?.boundingRegion.center.latitude //getting coordinates
                let longitude = respone?.boundingRegion.center.longitude
                let annotation = MKPointAnnotation()
                annotation.title = searchBar.text
                annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                self.mapView.addAnnotation(annotation) //add annotation to mapview
                let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                let span = MKCoordinateSpan(latitudeDelta: 0.1,longitudeDelta: 0.1) //span of zoom
                let region = MKCoordinateRegion(center: coordinate,span: span) //region for zoom
                self.mapView.setRegion(region, animated: true) //set zoom in
                if (latitude != nil) && (longitude != nil) && (annotation.title != nil) {
                    self.wayPoint?.lat = latitude!
                    self.wayPoint?.long = longitude!
                    self.wayPoint?.title = annotation.title!
                    print("success!")
                }
                print(self.wayPoint?.lat)
                self.addWaypointLabel.isHidden = false //make button visible
            }
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
