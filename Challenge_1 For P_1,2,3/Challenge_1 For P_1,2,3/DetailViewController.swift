//
//  DetailViewController.swift
//  Challenge_1 For P_1,2,3
//
//  Created by Abdulvokhid Azimov on 16.07.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedFlag: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = 
        //function allows us to show our image in detailViewController
        if let imageToLoad = selectedFlag {
            imageView.image = UIImage(named: imageToLoad)
        }
    }

}
