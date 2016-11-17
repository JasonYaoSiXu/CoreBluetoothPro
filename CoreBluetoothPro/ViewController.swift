//
//  ViewController.swift
//  CoreBluetoothPro
//
//  Created by yaosixu on 2016/11/17.
//  Copyright © 2016年 Jason_Yao. All rights reserved.
//

import UIKit
import CoreBluetooth
import CoreLocation
//6D810169-5797-4EF2-B141-554360C4086E
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        useBlueTooth()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func useBlueTooth() {
        guard let proximityUUID: UUID = UUID(uuidString: "6D810169-5797-4EF2-B141-554360C4086E") else {
            return
        }
        
        let coreBeaconRegion = CLBeaconRegion(proximityUUID: proximityUUID, identifier: "yaosixuBluetooth")
        let beaconPeripheralData: NSDictionary = coreBeaconRegion.peripheralData(withMeasuredPower: nil)
        let peripheralManager: CBPeripheralManager = CBPeripheralManager(delegate: self, queue: nil, options: nil)
        peripheralManager.startAdvertising(beaconPeripheralData as? [String: Any])
    }

}

extension ViewController: CBPeripheralManagerDelegate {
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        self.view.backgroundColor = UIColor.blue
    }
    
}

