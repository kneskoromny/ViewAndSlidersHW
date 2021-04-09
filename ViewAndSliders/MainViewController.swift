//
//  MainViewController.swift
//  ViewAndSliders
//
//  Created by Кирилл Нескоромный on 09.04.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewColor(
        for redSliderValue: Float,
        and greenSliderValue: Float,
        and blueSliderValue: Float)
}

class MainViewController: UIViewController {
    
    
    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.backgroundColor = UIColor(
            red: 255,
            green: 255,
            blue: 255,
            alpha: 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingsVC = segue.destination as? SettingsViewController {
            settingsVC.mainViewColor = mainView.backgroundColor
            settingsVC.delegate = self
        }
    }
}


extension MainViewController: SettingsViewControllerDelegate {
    func setNewColor(
        for redSliderValue: Float,
        and greenSliderValue: Float,
        and blueSliderValue: Float) {
        
        mainView.backgroundColor = UIColor(
            red: CGFloat(redSliderValue),
            green: CGFloat(greenSliderValue),
            blue: CGFloat(blueSliderValue),
            alpha: 1)
    }
}




