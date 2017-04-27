//
//  DraggableImageView.swift
//  Tinder
//
//  Created by Davis Wamola on 4/26/17.
//  Copyright © 2017 Davis Wamola. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {
    @IBOutlet var contentView: UIView!

    var initiaProfileImageCenter: CGPoint!

    @IBOutlet weak var profileImageView: UIImageView!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }

    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }

    @IBAction func onProfileImagePanGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: sender.view)
        let imageView = sender.view as! UIImageView

        print("HERE")
        if sender.state == .began {
            initiaProfileImageCenter = imageView.center
        } else if sender.state == .changed {
            imageView.center = CGPoint(x: initiaProfileImageCenter.x + translation.x, y: initiaProfileImageCenter.y)
        } else if sender.state == .ended {

        }
    }

}
