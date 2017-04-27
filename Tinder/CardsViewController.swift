//
//  ViewController.swift
//  Tinder
//
//  Created by Davis Wamola on 4/26/17.
//  Copyright © 2017 Davis Wamola. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var initiaProfileImageCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onProfileImagePanGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let imageView = sender.view as! UIImageView

        if sender.state == .began {
            initiaProfileImageCenter = imageView.center
        } else if sender.state == .changed {
            imageView.center = CGPoint(x: initiaProfileImageCenter.x + translation.x, y: initiaProfileImageCenter.y)
        } else if sender.state == .ended {

        }
    }


}

