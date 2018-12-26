//
//  car.swift
//  Class and Object
//
//  Created by Abdu on 12/25/18.
//  Copyright © 2018 Abdu. All rights reserved.
//

import Foundation
enum CarType{
    case Sedan
    case Coupe
    case hatchback
    
}
class Car{
    var color = "Black"
    var numberOfSeats = 0
    var typeOfCar : CarType = .Sedan
    
    init(){

    }
    
    convenience init(_ customerChosenColor : String) {
        self.init()
        self.color = customerChosenColor
    }
    
    func drive(){
        print("car is moving")
    }
    
    
}
