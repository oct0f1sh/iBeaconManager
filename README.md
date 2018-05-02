# iBeaconManager

[![CI Status](https://img.shields.io/travis/oct0f1sh/iBeaconManager.svg?style=flat)](https://travis-ci.org/oct0f1sh/iBeaconManager)
[![Version](https://img.shields.io/cocoapods/v/iBeaconManager.svg?style=flat)](https://cocoapods.org/pods/iBeaconManager)
[![License](https://img.shields.io/cocoapods/l/iBeaconManager.svg?style=flat)](https://cocoapods.org/pods/iBeaconManager)
[![Platform](https://img.shields.io/cocoapods/p/iBeaconManager.svg?style=flat)](https://cocoapods.org/pods/iBeaconManager)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

To use iBeaconManager you must import both iBeaconManager and CoreLocation.
```swift
import CoreLocation
import iBeaconManager
```
You also must add a description for  `NSLocationAlwaysAndWhenInUseUsageDescription` and `NSLocationWhenInUseUsageDescription` in your Info.plist.

## Installation

iBeaconManager is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'iBeaconManager'
```

## Usage

```swift
// subclass BeaconManagerDelegate
class ExampleClass: BeaconManagerDelegate {
    var beaconManager: BeaconManager
    
    init() {
        // create a Beacon object
        let beacon = Beacon(uuid: "00000000-0000-0000-0000-000000000000", major: 1234, minor: 5678, identifier: "example beacon")
        
        // initialize the BeaconManager class by passing in your Beacon object
        beaconManager = BeaconManager(beacon: beacon)
        
        // start monitoring for beacon activity
        beaconManager.startMonitoring()
    }
    
    // add protocol methods
    func beaconManager(sender: BeaconManager, isInBeaconRange region: CLRegion) {
        print("inside beacon range")
    }
    
    func beaconManager(sender: BeaconManager, isNotInBeaconRange region: CLRegion) {
        print("not inside beacon range")
    }
    
    func beaconManager(sender: BeaconManager, searchingInRegion region: CLRegion) {
        print("searching for beacon")
    }
    
    func beaconManager(sender: BeaconManager, enteredBeaconRegion region: CLRegion) {
        print("entered beacon region")
    }
    
    func beaconManager(sender: BeaconManager, exitedBeaconRegion region: CLRegion) {
        print("exited beacon region")
    }
    
    func beaconManager(sender: BeaconManager, monitoringRegionFailed region: CLRegion, withError error: Error) {
        print("monitoring for beacon failed")
    }
}
```


## Author

oct0f1sh, duncan@duncanmacdonald.us

## License

iBeaconManager is available under the MIT license. See the LICENSE file for more info.
