//
//  ViewController.swift
//  Challenge_1 For P_1,2,3
//
//  Created by Abdulvokhid Azimov on 13.07.2022.
//

import UIKit

class ViewController: UITableViewController {
    var flags = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //challenge-2 Load the list of available flags from the app bundle. You can type them directly into the code if you want, but its preferable not to.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix(".png"){
//                flags.append(item)
                print(item)
            }
        }
        //print(flags)
    }


}

