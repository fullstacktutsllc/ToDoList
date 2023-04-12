//
//  RoundedButton.swift
//  ToDoList
//
//  Created by Gwinyai Nyatsoka on 10/4/2023.
//

import UIKit

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