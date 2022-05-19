//
//  ResultViewController.swift
//  Delivery Tracking
//
//  Created by Koh Boon Yeow on 2022/4/22.
//

import UIKit
import CoreLocation
import MapKit

class ResultViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    var manager:CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        
        let lon : CLLocationDegrees = -112.06
             
             let lat : CLLocationDegrees = 33.45
             
             let coordinates = CLLocationCoordinate2D( latitude: lat, longitude: lon)
             let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
             
            let region = MKCoordinateRegion(center: coordinates, span: span)
             
             self.map.setRegion(region, animated: true)
             
             // add an annotation
             let annotation = MKPointAnnotation()
             annotation.coordinate = coordinates
             annotation.title = "Phoenix"
             annotation.subtitle = "AZ"
             
             self.map.addAnnotation(annotation)
    
    }
        
    @IBAction func finish(_ sender: Any) {
        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.tabViewController)
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
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
