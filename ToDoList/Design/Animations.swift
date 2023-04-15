//
//  Extension+UIView.swift
//  ToDoList
//
//  Created by Gwinyai Nyatsoka on 10/4/2023.
//

import Foundation
import UIKit


// Animations are added here for reusability.
extension UIView {
    /**
            An animation that scales a view to its original scale over 0.35 seconds with a spring
            - Precondition: The view must have a smaller scale before applying the animation
     */
    func scaleUpAnimation() {
        UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: [.curveEaseOut]) {
            self.transform = CGAffineTransform.identity
        }
    }
    
    /// An animation that creates a pulse like animation
    func pulseAnimation() {
        let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
        pulseAnimation.duration = 0.2
        pulseAnimation.toValue = 0.9
        pulseAnimation.autoreverses = true
        layer.add(pulseAnimation, forKey: nil)
    }
    
    /// An animation that shakes a view left to right
    func shakeAnimation() {
        let shakeAnimation = CABasicAnimation(keyPath: "position")
        shakeAnimation.duration = 0.1
        shakeAnimation.repeatCount = 2
        shakeAnimation.autoreverses = true
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        shakeAnimation.fromValue = fromPoint
        shakeAnimation.toValue = toPoint
        layer.add(shakeAnimation, forKey: nil)
    }
    
}
