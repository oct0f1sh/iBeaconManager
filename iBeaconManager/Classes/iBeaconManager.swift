//
//  BeaconManager.swift
//  SwiftBeaconManager
//
//  Created by Duncan MacDonald on 5/2/18.
//  Copyright © 2018 Duncan MacDonald. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

public struct Beacon {
    let uuid: UUID
    let major: UInt16
    let minor: UInt16
    let identifier: String
    
    public init(uuid: UUID, major: UInt16, minor: UInt16, identifier: String) {
        self.uuid = uuid
        self.major = major
        self.minor = minor
        self.identifier = identifier
    }
    
    public init(uuid: String, major: UInt16, minor: UInt16, identifier: String) {
        self.init(uuid: UUID(uuidString: uuid)!, major: major, minor: minor, identifier: identifier)
    }
}

public class BeaconManager: NSObject, CLLocationManagerDelegate {
    public var beaconRegion: CLBeaconRegion!
    var locationManager: CLLocationManager!
    public var isSearchingForBeacons = false
    public var status: BeaconStatus = .started
    
    public weak var delegate: BeaconManagerDelegate?
    
    public init(beacon: Beacon) {
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        beaconRegion = CLBeaconRegion(proximityUUID: beacon.uuid, major: beacon.major, minor: beacon.minor, identifier: beacon.identifier)
        
        beaconRegion.notifyOnEntry = true
        beaconRegion.notifyOnExit = true
        
        locationManager.requestAlwaysAuthorization()
    }
    
    public func startMonitoring() {
        locationManager.startMonitoring(for: beaconRegion)
        locationManager.startUpdatingLocation()
        isSearchingForBeacons = true
    }
    
    public func stopMonitoring() {
        locationManager.stopMonitoring(for: beaconRegion)
        locationManager.stopUpdatingLocation()
        isSearchingForBeacons = false
    }
    
    public func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        print(error.localizedDescription)
        delegate?.beaconManager(sender: self, monitoringRegionFailed: region!, withError: error)
        status = .failed
    }
    
    public func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        locationManager.requestState(for: beaconRegion)
        delegate?.beaconManager(sender: self, searchingInRegion: region)
        status = .searching
    }
    
    public func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        
    }
    
    public func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        delegate?.beaconManager(sender: self, enteredBeaconRegion: region)
        status = .enteredBeaconRange
    }
    
    public func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        delegate?.beaconManager(sender: self, exitedBeaconRegion: region)
        status = .exitedBeaconRange
    }
}

public protocol BeaconManagerDelegate: class {
    func beaconManager(sender: BeaconManager, isInBeaconRange region: CLRegion)
    func beaconManager(sender: BeaconManager, isNotInBeaconRange region: CLRegion)
    func beaconManager(sender: BeaconManager, searchingInRegion region: CLRegion)
    func beaconManager(sender: BeaconManager, enteredBeaconRegion region: CLRegion)
    func beaconManager(sender: BeaconManager, exitedBeaconRegion region: CLRegion)
    func beaconManager(sender: BeaconManager, monitoringRegionFailed region: CLRegion, withError error: Error)
}

public enum BeaconStatus {
    case started
    case failed
    case inBeaconRange
    case notInBeaconRange
    case searching
    case enteredBeaconRange
    case exitedBeaconRange
}

