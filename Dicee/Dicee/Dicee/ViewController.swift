//
//  ViewController.swift
//  Dicee
//
//  Created by Abdu on 12/23/18.
//  Copyright © 2018 . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let diceeArray = ["Dicee1","Dicee2","Dicee3","Dicee4","Dicee5","Dicee6"]
    var randomDiceeIndex1 : Int = 0
    var randomDiceeIndex2 : Int = 0
    
    @IBOutlet weak var diceeImageView1: UIImageView!
    @IBOutlet weak var diceeImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateDiceeImage()
    }

    @IBAction func roolButtonPress(_ sender: Any) {
        updateDiceeImage()
      
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
         updateDiceeImage()
    }
    
    func updateDiceeImage(){
        randomDiceeIndex1 = Int.random(in: 0 ... 5)
        randomDiceeIndex2 = Int.random(in: 0 ... 5)
        diceeImageView1.image = UIImage(named: diceeArray[randomDiceeIndex1])
        diceeImageView2.image = UIImage(named: diceeArray[randomDiceeIndex2])
    }
    
}

