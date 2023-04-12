//
//  Colors.swift
//  ToDoList
//
//  Created by Gwinyai Nyatsoka on 7/4/2023.
//

import Foundation
import UIKit

extension UIColor {
    
    static var work: UIColor {
        return UIColor(named: "work")!
    }
    
    static var secondaryWork: UIColor {
        return UIColor(named: "work")!.withAlphaComponent(0.2)
    }
    
    static var excercise: UIColor {
        return UIColor(named: "excercise")!
    }
    
    static var secondaryExcercise: UIColor {
        return UIColor(named: "excercise")!.withAlphaComponent(0.2)
    }
    
    static var study: UIColor {
        return UIColor(named: "study")!
    }
    
    static var secondaryStudy: UIColor {
        return UIColor(named: "study")!.withAlphaComponent(0.2)
    }
    
    static var secondaryLink: UIColor {
        return UIColor(named: "secondaryLink")!
    }
    
}
