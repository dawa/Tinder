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
        let translation = sender.translation(in: contentView)
        let velocity = sender.velocity(in: contentView)
        let location = sender.location(in: contentView)

        if sender.state == .began {
            initiaProfileImageCenter = profileImageView.center
        } else if sender.state == .changed {

            if velocity.x > 0 || velocity.x < 0 {
                // upper half
                if location.y < initiaProfileImageCenter.y {
                    profileImageView.transform = CGAffineTransform(rotationAngle: translation.x.degreesToRadians)
                } else {
                // lower half
                    profileImageView.transform = CGAffineTransform(rotationAngle: -translation.x.degreesToRadians)
                }
            }

            profileImageView.center = CGPoint(x: initiaProfileImageCenter.x + translation.x, y: initiaProfileImageCenter.y)


        } else if sender.state == .ended {

        }
    }
}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
}
extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}
