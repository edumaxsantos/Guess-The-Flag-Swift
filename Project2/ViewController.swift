//
//  ViewController.swift
//  Project2
//
//  Created by Eduardo Santos on 27/05/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var askedQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        askedQuestions += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) - Score: \(score)"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if askedQuestions > 10 {
            finalMessage()
            return
        }
        var title: String
        var message: String
        if sender.tag == correctAnswer {
            score += 1
            title = "Correct"
            message = "Your score is now \(score)"
        } else {
            title = "Wrong"
            message = "Wrong! That's the flag of \(countries[sender.tag].uppercased())"
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
    
    func finalMessage() {
        let ac = UIAlertController(title: "Final score", message: "You got \(score) correct out of \(askedQuestions - 1)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        present(ac, animated: true)
    }
    


}

