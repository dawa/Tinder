//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Davis Wamola on 4/26/17.
//  Copyright © 2017 Davis Wamola. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    @IBOutlet weak var profileImageView: UIImageView!
    var profileImage: UIImage!
    var isPresenting: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.image = profileImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        print("animating transition")
        let containerView = transitionContext.containerView
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)

        if (isPresenting) {
            containerView.addSubview((toViewController?.view)!)
            toViewController?.view.alpha = 0
            UIView.animate(withDuration: 0.4, animations: { () -> Void in
                toViewController?.view.alpha = 1
            }) { (finished: Bool) -> Void in
                transitionContext.completeTransition(true)
            }
        } else {
            UIView.animate(withDuration: 0.4, animations: { () -> Void in
                fromViewController?.view.alpha = 0
            }) { (finished: Bool) -> Void in
                transitionContext.completeTransition(true)
                fromViewController?.view.removeFromSuperview()
            }
        }
    }

    @IBAction func onNavTapGesture(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true)
    }
}
