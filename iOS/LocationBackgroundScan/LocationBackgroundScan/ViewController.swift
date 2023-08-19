//
//  ViewController.swift
//  LocationBackgroundScan
//
//  Created by 김소진 on 2023/08/09.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManger = CLLocationManager()
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var longLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.allowsBackgroundLocationUpdates = true
        locationManger.requestWhenInUseAuthorization()
        
        DispatchQueue.global().async { [self] in
            if CLLocationManager.locationServicesEnabled() {
                print("위치 서비스 On 상태")
                locationManger.startUpdatingLocation()
                print(locationManger.location!.coordinate)
            } else {
                print("위치 서비스 off 상태")
            }
        }
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations location: [CLLocation]) {
        print("didUpdateLocation")
        if let location = location.first {
            latLabel.text = "위도: \(location.coordinate.latitude)"
            longLabel.text = "경도: \(location.coordinate.longitude)"
            
            print("위도: \(location.coordinate.latitude)")
            print("경도: \(location.coordinate.longitude)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

}

