//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Davis Wamola on 4/26/17.
//  Copyright © 2017 Davis Wamola. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    var profileImage: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.image = profileImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onNavTapGesture(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true)
    }
}
