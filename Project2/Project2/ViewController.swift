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
        
//        button1.layer.borderColor = UIColor.lightGray.cgColor
//        button2.layer.borderColor = UIColor.lightGray.cgColor
//        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle() //call array randomly
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        let uppercasedCountries = countries[correctAnswer].uppercased() // Try showing the player's score in the navigation bar, alongside the flag to guess
        title = "Score \(score) - Tap on \(uppercasedCountries)"
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showScore))
    }

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong That's flag of \(countries[sender.tag].uppercased())" // when someone chooses the wrong flag, tell them their mistake in your alert message - something like "Wrong! That's flah of ..."
            score -= 1
        }
        // Keep track of how many questions have been asked, and show one final alert controller after they have answered 10. This should show their final score.
        askedQuestions += 1
        if askedQuestions < 10 {
            let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Cantinue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: title, message: "Your final score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Play again", style: .default, handler: startNewGame))
            present(ac, animated: true)
        }
        // Start a new game
        func startNewGame(action: UIAlertAction) {
            score = 0
            askedQuestions = 0
                    
            askQuestion()
        }
    }
    //Swift challenge-3 day-22 3.Go back to project 2 and add a bar button item that shows their score when tapped.
//    @objc func showScore() {
//        let scoreAlert = UIAlertController(title: "Score", message: nil, preferredStyle: .actionSheet)
//        scoreAlert.addAction(UIAlertAction(title: "Your current score is \(score)", style: .default, handler: nil))
//        present(scoreAlert, animated: true)
//    }
}

