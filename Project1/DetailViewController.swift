//
//  DetailViewController.swift
//  Project1
//
//  Created by Abdulvokhid Azimov on 02.07.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
}
