//
//  CategoryModel.swift
//  ToDoList
//
//  Created by Gwinyai Nyatsoka on 28/12/2022.
//

import Foundation
import UIKit
import RealmSwift

/// Represents a task's category.
enum Category: String, CaseIterable, PersistableEnum {
    case work = "Work", study = "Study", excercise = "Excercise"
    /// Convenient variable to get category color
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
    /// Secondary color is used to get the secondary  color from the category color
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
