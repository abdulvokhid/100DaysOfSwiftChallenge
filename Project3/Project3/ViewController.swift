//
//  ViewController.swift
//  Project3
//
//  Created by Abdulvokhid Azimov on 10.07.2022.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath! //This is a data type that lets us work with the filesystem, and in our case we'll be using it to look for files.
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                //this is picture load
                pictures.append(item)
            }
        }
        print(pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
}

