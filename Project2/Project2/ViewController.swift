//  ViewController.swift
//  Project2
//
//  Created by Abdulvokhid Azimov on 05.07.2022.
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
        
        countries += ["estonia","france","germany","ireland",
                      "italy","monaco","nigeria","poland",
                      "russia","spain","uk","us"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle() //call array randomly
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        let uppercasedCountries = countries[correctAnswer].uppercased() //Challenge-1 Try showing the player's score in the navigation bar, alongside the flag to guess
        title = "Score \(score) - Tap on \(uppercasedCountries)"
    }

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if  sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong That's flag of \(countries[sender.tag].uppercased())" //Challenge-3 when someone chooses the wrong flag, tell them their mistake in your alert message - something like "Wrong! That's flah of ..."
            score -= 1
        }
        if askedQuestions < 10 {
            let alertController = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))

            present(alertController, animated: true)
        } else {
            let finalAlertController = UIAlertController(title: "Game is Over!", message: "Your score is \(score)", preferredStyle: .alert)
            finalAlertController.addAction(UIAlertAction(title: "Start new game!", style: .default, handler: startNewGame))
            present(finalAlertController, animated: true)
        }
       
    }
    func startNewGame(action: UIAlertAction) {
        score = 0
        askedQuestions = 0
        
        askQuestion()
    }
}

