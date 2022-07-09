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
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            let wrong = UIAlertController(title: .none, message: "Wrong! That's flag of \(countries)", preferredStyle: .alert)
            wrong.addAction(UIAlertAction(title: "Start new game", style: .default, handler: askQuestion))
            score -= 1
        }
        
        let ac = UIAlertController(title: "Game Over!", message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
}

