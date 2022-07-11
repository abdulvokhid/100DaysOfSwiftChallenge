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
    var selectedPictureNumber: Int?
    var totalPictureNumber: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Picture \(selectedPictureNumber!) of \(totalPictureNumber!)"
        navigationItem.largeTitleDisplayMode = .never //we dont wanna use large title in our detail screen
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(suggest))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func suggest() {
        let shareLink = "Try it: https://github.com/Cellomaster87/Storm-Viewer"
        let vc = UIActivityViewController(activityItems: [shareLink], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
