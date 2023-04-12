//
//  TaskModel.swift
//  ToDoList
//
//  Created by Gwinyai Nyatsoka on 31/12/2022.
//

import Foundation

struct Task {
    let id: String
    let category: Category
    let caption: String
    let createdDate: Date
    var isComplete: Bool
    
}
