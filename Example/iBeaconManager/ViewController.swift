//
//  ViewController.swift
//  iBeaconManager
//
//  Created by oct0f1sh on 05/02/2018.
//  Copyright (c) 2018 oct0f1sh. All rights reserved.
//

import UIKit
import CoreLocation
import iBeaconManager

class ViewController: UIViewController {
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    
    var beaconManager: BeaconManager!
    
    override func viewDidLoad() {
        // ENTER YOUR BEACON INFORMATION HERE
        let beacon = Beacon(uuid: "B9407F30-F5F8-466E-AFF9-25556B57FE6D", major: 44941, minor: 4437, identifier: "test beacon")
        
        beaconManager = BeaconManager(beacon: beacon)
        beaconManager.delegate = self
    }
    
    @IBAction func startSearchingTapped(_ sender: Any) {
        if !beaconManager.isSearchingForBeacons {
            beaconManager.startMonitoring()
            searchButton.setTitle("stop searching", for: .normal)
        } else {
            beaconManager.stopMonitoring()
            statusLabel.text = "not searching"
            searchButton.setTitle("start searching", for: .normal)
        }
    }
}

extension ViewController: BeaconManagerDelegate {
    func beaconManager(sender: BeaconManager, isInBeaconRange region: CLRegion) {
        statusLabel.text = "in beacon range: \(region.identifier)"
        print("in beacon range: \(region.identifier)")
    }
    
    func beaconManager(sender: BeaconManager, isNotInBeaconRange region: CLRegion) {
        statusLabel.text = "not in beacon range"
        print("not in beacon range")
    }
    
    func beaconManager(sender: BeaconManager, searchingInRegion region: CLRegion) {
        statusLabel.text = "searching for beacons in region: \(region.identifier)"
        print("searching for beacons in region: \(region.identifier)")
    }
    
    func beaconManager(sender: BeaconManager, enteredBeaconRegion region: CLRegion) {
        statusLabel.text = "entered beacon region: \(region.identifier)"
        print("entered beacon region: \(region.identifier)")
    }
    
    func beaconManager(sender: BeaconManager, exitedBeaconRegion region: CLRegion) {
        statusLabel.text = "exited beacon region: \(region.identifier)"
        print("exited beacon region: \(region.identifier)")
    }
    
    func beaconManager(sender: BeaconManager, monitoringRegionFailed region: CLRegion, withError error: Error) {
        statusLabel.text = "monitoring failed on region: \(region.identifier)"
        print("monitoring failed on region: \(region.identifier)")
    }
}

