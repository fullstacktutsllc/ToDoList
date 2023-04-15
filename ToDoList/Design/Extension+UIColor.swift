//
//  Colors.swift
//  ToDoList
//
//  Created by Gwinyai Nyatsoka on 7/4/2023.
//

import Foundation
import UIKit

// Colors from the Colors catalog are added here as a programatic way to access them.
extension UIColor {
    /// Returns a green color
    static var work: UIColor {
        return UIColor(named: "work")!
    }
    /// Returns a slightly transparent green color
    static var secondaryWork: UIColor {
        return UIColor(named: "work")!.withAlphaComponent(0.2)
    }
    /// Returns an orange color
    static var excercise: UIColor {
        return UIColor(named: "excercise")!
    }
    /// Returns a slightly transparent orange color
    static var secondaryExcercise: UIColor {
        return UIColor(named: "excercise")!.withAlphaComponent(0.2)
    }
    /// Returns a red color
    static var study: UIColor {
        return UIColor(named: "study")!
    }
    /// Returns a slightly transparent red color
    static var secondaryStudy: UIColor {
        return UIColor(named: "study")!.withAlphaComponent(0.2)
    }
    /// Returns a blue color
    static var secondaryLink: UIColor {
        return UIColor(named: "secondaryLink")!
    }
    
}
