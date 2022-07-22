//
//  ViewController.swift
//  Project5
//
//  Created by Abdulvokhid Azimov on 22.07.2022.
//

import UIKit

class ViewController: UITableViewController {

    var allWords = [String]()
    var usedWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let startWordsUrl = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let startWords = try? String(contentsOf: startWordsUrl) {
                allWords = startWords.components(separatedBy: "\n")
            } else {
                allWords = ["silkworm"]
            }
        }
        
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        
        startGame()
    }

    func startGame() {
        title = allWords.randomElement() // sets title to random array
        usedWords.removeAll(keepingCapacity: true) //removes all words thats used in array
        tableView.reloadData() //it calls reloadData method to reloads all data, its good for upgrading next level
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return usedWords.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
}

