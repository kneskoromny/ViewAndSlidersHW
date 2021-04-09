//
//  ViewController.swift
//  ViewAndSliders
//
//  Created by Кирилл Нескоромный on 26.03.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var redSliderValueLabel: UILabel!
    @IBOutlet weak var greenSliderValueLabel: UILabel!
    @IBOutlet weak var blueSliderValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var mainViewColor: UIColor!

    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // View
        mainView.layer.cornerRadius = mainView.frame.height / 7
        mainView.backgroundColor = mainViewColor
       
        getColors()
        
        // Sliders
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        //Labels
        redSliderValueLabel.text = String(format: "%.2f", redSlider.value)
        greenSliderValueLabel.text = String(format: "%.2f", greenSlider.value)
        blueSliderValueLabel.text = String(format: "%.2f",  blueSlider.value)
        
        
    }
    
    @IBAction func redSliderChanged() {
        redSliderValueLabel.text = String(format: "%.2f", redSlider.value)
        changeViewBackgroundColor()
    }
    @IBAction func greenSliderChanged() {
        greenSliderValueLabel.text = String(format: "%.2f", greenSlider.value)
        changeViewBackgroundColor()
    }
    @IBAction func blueSliderChanged() {
        blueSliderValueLabel.text = String(format: "%.2f",  blueSlider.value)
        changeViewBackgroundColor()
    }
  
    @IBAction func doneButtonPressed() {
        
        delegate.setNewColor(
            for: redSlider.value,
            and: greenSlider.value,
            and: blueSlider.value)
        
        dismiss(animated: true)
    }
    
    private func changeViewBackgroundColor() {
        mainView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    private func getColors() {
        let colorsValues = (mainViewColor.cgColor.components)!
        
        redSlider.value = Float(colorsValues[0])
        greenSlider.value = Float(colorsValues[1])
        blueSlider.value = Float(colorsValues[2])
    }
   
}


