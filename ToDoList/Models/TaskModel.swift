//
//  TaskModel.swift
//  ToDoList
//
//  Created by Gwinyai Nyatsoka on 31/12/2022.
//

import Foundation
import RealmSwift

/// Represents a task
struct Task {
    let id: String
    let category: Category
    let caption: String
    let createdDate: Date
    var isComplete: Bool
}

class LocalTask: Object {
    @Persisted(primaryKey: true) var _id: String
    @Persisted var category = Category.study
    @Persisted var caption = ""
    @Persisted var createdDate = Date()
    @Persisted var isComplete = false
}
