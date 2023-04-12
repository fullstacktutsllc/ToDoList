//
//  SettingsViewController.swift
//  ToDoList
//
//  Created by Gwinyai Nyatsoka on 9/4/2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var settingsTitleLabel: UILabel!
    @IBOutlet weak var appThemeLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var modalView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTitleLabel.font = UIFont.style(.h1)
        appThemeLabel.font = UIFont.style(.formLabel)
        modalView.transform = CGAffineTransform(scaleX: 0, y: 0)
        let window = UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first { $0.isKeyWindow }
        if let window = window {
            switch window.overrideUserInterfaceStyle {
            case .light:
                segmentedControl.selectedSegmentIndex = 0
            case .dark:
                segmentedControl.selectedSegmentIndex = 1
            case .unspecified:
                segmentedControl.selectedSegmentIndex = 2
            @unknown default:
                segmentedControl.selectedSegmentIndex = 2
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        modalView.scaleUpAnimation()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        modalView.layer.cornerRadius = 5
    }

    @IBAction func dismissButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        //uiapplication
        //windowscenes
        //windows
        //keyWindow
        //overrideUserInterfaceStyle
        
        let window = UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first { $0.isKeyWindow }
        
        if sender.selectedSegmentIndex == 0 {
            window?.overrideUserInterfaceStyle = .light
        }
        else if sender.selectedSegmentIndex == 1 {
            window?.overrideUserInterfaceStyle = .dark
        }
        else {
            window?.overrideUserInterfaceStyle = .unspecified
        }
        
    }

}
