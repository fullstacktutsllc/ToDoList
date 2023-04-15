//
//  TaskTableViewCell.swift
//  ToDoList
//
//  Created by Gwinyai Nyatsoka on 12/12/2022.
//

import UIKit

/**
    TaskTableViewCellDelegate links the TaskTableViewCell and the HomeViewController.
 */
protocol TaskTableViewCellDelegate: AnyObject {
    func editTask(id: String)
    func markTask(id: String, complete: Bool)
}

/// The cell responsible for displaying tasks in the tableview in the HomeViewController
class TaskTableViewCell: UITableViewCell {
    
    static let identifier = "TaskTableViewCell"
    @IBOutlet weak var categoryContainerView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var isCompleteImageView: UIImageView!
    @IBOutlet weak var stripView: UIView!
    private weak var delegate: TaskTableViewCellDelegate?
    private var task: Task!
    
    private var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryLabel.font = UIFont.style(.category)
        captionLabel.font = UIFont.style(.body)
        dateLabel.font = UIFont.style(.caption)
        categoryContainerView.layer.cornerRadius = categoryContainerView.frame.height / 2
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
    }
    
    /**
        Every cell is configured here.
        - Parameters:
            - withTask task: The task to display
            - delegate: A reference to the TaskTableViewCellDelegate used to communicate the user wishes to edit the task
     */
    func configure(withTask task: Task, delegate: TaskTableViewCellDelegate?) {
        stripView.backgroundColor = task.category.color
        categoryContainerView.backgroundColor = task.category.secondaryColor
        categoryLabel.textColor = task.category.color
        categoryLabel.text = task.category.rawValue
        captionLabel.text = task.caption
        isCompleteImageView.image = task.isComplete ? UIImage(systemName: "checkmark.circle") : UIImage(systemName: "circle")
        dateLabel.text = dateFormatter.string(from: task.createdDate)
        selectionStyle = .none
        let tap = UITapGestureRecognizer(target: self, action: #selector(toggleCompletion))
        isCompleteImageView.addGestureRecognizer(tap)
        isCompleteImageView.isUserInteractionEnabled = true
        self.task = task
        self.delegate = delegate
    }
    
    @objc func toggleCompletion() {
        task.isComplete.toggle()
        delegate?.markTask(id: task.id, complete: task.isComplete)
    }
    
    
    @IBAction func editTaskButtonTapped(_ sender: Any) {
        delegate?.editTask(id: task.id)
    }

}
