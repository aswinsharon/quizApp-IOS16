//
//  ViewController.swift
//  qizzApp
//
//  Created by Aswin Sharon on 07/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var Constants = variableConstants()
    var quizBrain = QuizBrain()
    
    
    func validation(sender: UIButton){
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            
            sender.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.5)
            
        } else {
            
            sender.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
                        
        }
    }
    
    func updateUI(){
        
        self.questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score : \(quizBrain.calculateScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        self.validation(sender: sender)
        
        quizBrain.nextQuestion()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
            self.updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
            self.updateUI()
        }
    }


}

