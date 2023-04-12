//
//  NewTaskViewController.swift
//  ToDoList
//
//  Created by Gwinyai Nyatsoka on 18/12/2022.
//

import UIKit

protocol NewTaskDelegate: AnyObject {
    func closeView()
}

class NewTaskViewController: UIViewController {
    
    lazy var modalView: NewTaskModalView = {
        let modalWidth = view.frame.width - CGFloat(30)
        let modalHeight: CGFloat = 430
        let frame = CGRect(x: 15, y: view.center.y - (modalHeight / 2), width: modalWidth, height: modalHeight)
        let modalView = NewTaskModalView(frame: frame, task: task)
        modalView.delegate = self
        return modalView
    }()
    private var task: Task?
    
    init(task: Task? = nil) {
        super.init(nibName: nil, bundle: nil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
        self.task = task
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        modalView.transform = CGAffineTransform(scaleX: 0, y: 0)
        view.addSubview(modalView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: [.curveEaseOut]) {
//            self.modalView.transform = CGAffineTransform.identity
//        }
        modalView.scaleUpAnimation()
        
    }

}

//MARK: - Conformance to New Task Delegate
extension NewTaskViewController: NewTaskDelegate {
    
    func closeView() {
        dismiss(animated: true)
    }
    
}
