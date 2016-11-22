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
    
    var coreBeaconRegion: CLBeaconRegion!
    var peripheralManager: CBPeripheralManager!
    var beaconPeripheralData: NSDictionary!

    override func viewDidLoad() {
        super.viewDidLoad()
        let uuidStr = "E16D436A-339B-4979-BD15-76878BA1A518"
        guard let proximityUUID: UUID = UUID(uuidString: uuidStr) else {
            return
        }
        coreBeaconRegion = CLBeaconRegion(proximityUUID: proximityUUID, major: 1, minor: 1, identifier: "yaosixu")
        beaconPeripheralData = coreBeaconRegion.peripheralData(withMeasuredPower: nil)
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapAction(_ sender: UIButton) {
//        beaconPeripheralData = coreBeaconRegion.peripheralData(withMeasuredPower: nil)
//        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
    }
}

extension ViewController: CBPeripheralManagerDelegate {
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        self.view.backgroundColor = UIColor.blue
        if peripheral.state == .poweredOn {
            print("\(#function)")
            peripheralManager.startAdvertising(beaconPeripheralData as? [String: Any])
        } else {
            print("is off")
        }
        
    }
    
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        print("\(error)")
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didAdd service: CBService, error: Error?) {
        print("\(error)")
    }
    
    
}

