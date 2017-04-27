//
//  ViewController.swift
//  Tinder
//
//  Created by Davis Wamola on 4/26/17.
//  Copyright © 2017 Davis Wamola. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onImageTapGesture(_ sender: UITapGestureRecognizer) {
        let image = sender.view as! DraggableImageView
        performSegue(withIdentifier: "profileDetailSegue", sender: image)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileDetailSegue" {
            let profileDetailController = segue.destination as! ProfileViewController
            let draggableImage = sender as! DraggableImageView
            profileDetailController.profileImage = draggableImage.profileImageView.image
            profileDetailController.modalPresentationStyle = .custom
            profileDetailController.transitioningDelegate = self as? UIViewControllerTransitioningDelegate
        }
    }
}

