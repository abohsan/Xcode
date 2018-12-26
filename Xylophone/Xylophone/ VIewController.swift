//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
//import AudioToolbox
import AVFoundation

class ViewController: UIViewController{
    
//    "import AVFoundation" needs to be implemented in the top for this method
//    var player : AVAudioPlayer?
    
    var audioPlayer : AVAudioPlayer!
    let soundArray = [ "note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        var selectedSoundFileName: String = soundArray[sender.tag-1]
        playSound3(selectedSoundFileName)
    }

    func playSound3(_ selected : String){
        let soundURL = Bundle.main.url(forResource: selected, withExtension : "wav")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }catch {
            print(error)
            
        }
        audioPlayer?.play()
    }
  
    //    func playSound1(){
    //        ///////// --------- new method ----------
    //        //        "import AVFoundation" needs to be implemented in the top for this method
    //        let url = Bundle.main.url(forResource : "note1" ,withExtension : "wav")!
    //        do{
    //            player = try AVAudioPlayer(contentsOf: url)
    //            guard let player = player else {return}
    //            player.prepareToPlay()
    //            player.play()
    //
    //        }catch let error as Error{
    //            print(error)
    //        }
    //    }
    //    func playSound2(){
    //        ///////// --------- new method ----------
    //        //        "import AudioToolbox" needs to be implemented in the top for this method
    //        if let soundURL = Bundle.main.url(forResource: "note1", withExtension : "wav"){
    //            var mySound: SystemSoundID = 0
    //            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
    //
    //            AudioServicesPlaySystemSound(mySound)
    //        }
    //
    //
    //    }
}

