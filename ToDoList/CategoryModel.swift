//
//  CategoryModel.swift
//  ToDoList
//
//  Created by Gwinyai Nyatsoka on 28/12/2022.
//

import Foundation
import UIKit

enum Category: String, CaseIterable {
    case work = "Work", study = "Study", excercise = "Excercise"
    
    var color: UIColor {
        switch self {
        case .work:
            return UIColor.work
        case .excercise:
            return UIColor.excercise
        case .study:
            return UIColor.study
        }
    }
    
    var secondaryColor: UIColor {
        switch self {
        case .work:
            return UIColor.secondaryWork
        case .excercise:
            return UIColor.secondaryExcercise
        case .study:
            return UIColor.secondaryStudy
        }
    }
    
    
}
