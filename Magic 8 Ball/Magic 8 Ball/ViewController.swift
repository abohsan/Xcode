//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Abdu on 12/24/18.
//  Copyright © 2018 Abdu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    let ballArray = ["ball1","ball2","ball3","ball4","ball5"]
    var randomBallNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomBallNumber = Int.random(in: 0 ... 4)
       imageView.image = UIImage(named:ballArray[randomBallNumber])
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        newBallImage()
    }
    @IBAction func askButtonPressed(_ sender: Any) {
        newBallImage()
    }
    func newBallImage(){
        randomBallNumber = Int.random(in: 0 ... 4)
        imageView.image = UIImage(named:ballArray[randomBallNumber])
    }
    
}

