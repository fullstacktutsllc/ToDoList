//
//  RoundedButton.swift
//  ToDoList
//
//  Created by Gwinyai Nyatsoka on 10/4/2023.
//

import UIKit

/// A useful component to create a button with rounded corners
class RoundedButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel?.font = UIFont.style(.buttonTitle)
        backgroundColor = UIColor.link
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 5
    }

}
