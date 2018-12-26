//
//  SelfDrivingCar.swift
//  Class and Object
//
//  Created by Abdu on 12/25/18.
//  Copyright © 2018 Abdu. All rights reserved.
//

import Foundation

class SelfDrivingCar : Car{
    
    var destination : String?
    
    override func drive() {
        super.drive()
        
        if let userSetDestination = destination{
            print("driving towards " + userSetDestination)
        }
    }
    
    
}
