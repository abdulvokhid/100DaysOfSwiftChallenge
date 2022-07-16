//
//  ViewController.swift
//  Challenge_1 For P_1,2,3
//
//  Created by Abdulvokhid Azimov on 13.07.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var flags = [String]()
    // adds imageView to our cell
    let myFlags = [UIImage(named: "nigeria@3x"),
                   UIImage(named: "spain@3x"),
                   UIImage(named: "italy@3x"),
                   UIImage(named: "germany@3x"),
                   UIImage(named: "ireland@3x"),
                   UIImage(named: "estonia@3x"),
                   UIImage(named: "russia@3x"),
                   UIImage(named: "poland@3x"),
                   UIImage(named: "uk@3x"),
                   UIImage(named: "us@3x"),
                   UIImage(named: "france@3x"),
                   UIImage(named: "monaco@3x")]
    
    override func viewDidLoad() {
        
        title = "Flags"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //challenge-2 Load the list of available flags from the app bundle. You can type them directly into the code if you want, but its preferable not to.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix(".png"){
//                flags.append(item)
                flags.append(item)
                //flags.sort()
            }
        }
        print(flags)
    }
    
    // MARK: - Shows the list of the flags in ViewController
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flags", for: indexPath)
        cell.textLabel?.text = flags[indexPath.row]
        cell.imageView?.image = myFlags[indexPath.row]
        return cell
    }
    
    //MARK: - Show selected image in DetailViewController
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedFlag = flags[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }

}

