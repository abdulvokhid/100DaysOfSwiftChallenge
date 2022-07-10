//
//  DetailViewController.swift
//  Project3
//
//  Created by Abdulvokhid Azimov on 10.07.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var selectedPictureNumber: Int?
    var totalPicture: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = " Picture \(selectedPictureNumber!) of \(totalPicture!)"
        
        navigationItem.largeTitleDisplayMode = .never
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
    }
    
}
