//
//  SettingsViewController.swift
//  ToDoList
//
//  Created by Gwinyai Nyatsoka on 9/4/2023.
//

import UIKit

/// This allows the user to change settings. The only setting available is the ability to change interface style to light, dark or system preference.
class SettingsViewController: UIViewController {
    
    @IBOutlet weak var settingsTitleLabel: UILabel!
    @IBOutlet weak var appThemeLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var modalView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        settingsTitleLabel.font = UIFont.style(.h1)
        appThemeLabel.font = UIFont.style(.formLabel)
        //We change the transform of the modal view to zero to perform a scale up animation when the view appears
        modalView.transform = CGAffineTransform(scaleX: 0, y: 0)
        //We change the segmented control's selected index to the current interface style
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
        //This animates the modal view using a scale up animation whereas it was initially set to a scale of zero in the viewDidLoad
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
        /*
         The hierarchy for views is as follows:
         - uiapplication
         - windowscenes
         - windows
         - keyWindow
         - overrideUserInterfaceStyle
         We obtain the window to change the interface style below
         */
        let window = UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first { $0.isKeyWindow }
        
        if sender.selectedSegmentIndex == 0 {
            window?.overrideUserInterfaceStyle = .light
            UserDefaults.standard.set(0, forKey: "interfacePreference")
        }
        else if sender.selectedSegmentIndex == 1 {
            window?.overrideUserInterfaceStyle = .dark
            UserDefaults.standard.set(1, forKey: "interfacePreference")
        }
        else {
            window?.overrideUserInterfaceStyle = .unspecified
            UserDefaults.standard.set(2, forKey: "interfacePreference")
        }
        
    }

}
