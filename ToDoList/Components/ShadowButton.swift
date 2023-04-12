//
//  ShadowButton.swift
//  ToDoList
//
//  Created by Gwinyai Nyatsoka on 10/4/2023.
//

import UIKit


@IBDesignable
class ShadowButton: UIButton {
    
    @IBInspectable
    var cornerRadius: CGFloat = 5 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var background: UIColor = .link {
        didSet {
            backgroundColor = background
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor = .red {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    override func prepareForInterfaceBuilder() {
        titleLabel?.font = UIFont.style(.buttonTitle)
        backgroundColor = background
        layer.shadowColor = shadowColor.cgColor
        layer.masksToBounds = false
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
        
        //layer.shadowColor = UIColor(named: "secondaryLink")?.cgColor
        
    }

}
