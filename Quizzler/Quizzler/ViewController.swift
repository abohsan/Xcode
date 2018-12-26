//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var buttonStart: UIButton!
    @IBOutlet weak var buttonFalse: UIButton!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var buttonTrue: UIButton!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = "اهلا وسهلا \n  C_Java2017 \n جميع الاسئله باللغة الانجلزيه اتمني لك التوفيق"
        
        buttonTrue.isHidden = true
        buttonFalse.isHidden = true
        
        updateUI()
    }

    @IBAction func buttenPre(_ sender: Any) {
        buttonStart.isHidden = true
        buttonTrue.isHidden = false
        buttonFalse.isHidden = false
         nextQuestion()
    }
    
    @IBAction func answerPressed(_ sender: AnyObject) {
  
        if sender.tag == 1{
            pickedAnswer = true
            
        }else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1 )/13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
        
        if questionNumber <= 12{
           questionLabel.text = allQuestions.list[questionNumber].questionText
            
            updateUI()
            
        }else{
            let alart = UIAlertController(title:"Awesome", message: "you have finished the quiz. would you like to restart the quiz?", preferredStyle: .alert )
            
            let restartAction = UIAlertAction(title : "Restart", style : .default, handler : { (UIAlertAction) in
              self.startOver()
            })
            alart.addAction(restartAction)

            present(alart, animated: true, completion: nil)
        }
        
        
    }
    
    
    func checkAnswer() {
        

        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer == pickedAnswer{
           
            ProgressHUD.showSuccess("Correct")
            score += 1
        } else{
            ProgressHUD.showError("Wrong")
        }
        
        questionNumber += 1
   nextQuestion()
    
    }
    
    
    func startOver() {
        score = 0
       questionNumber = 0
        nextQuestion()
    }
    

    
}
