//
//  ViewController.swift
//  ViewAndSliders
//
//  Created by Кирилл Нескоромный on 26.03.2021.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {

    //MARK: - IB Outlets
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var redSliderValueLabel: UILabel!
    @IBOutlet weak var greenSliderValueLabel: UILabel!
    @IBOutlet weak var blueSliderValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redSliderTF: UITextField!
    @IBOutlet weak var greenSliderTF: UITextField!
    @IBOutlet weak var blueSliderTF: UITextField!
    
    var mainViewColor: UIColor!
    
    var delegate: SettingsViewControllerDelegate!
   
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // View
        
        mainView.layer.cornerRadius = mainView.frame.height / 7
        mainView.backgroundColor = mainViewColor
        
        let colorsValues = (mainViewColor.cgColor.components)!
   
        // Slider
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        redSlider.value = Float(colorsValues[0])
        greenSlider.value = Float(colorsValues[1])
        blueSlider.value = Float(colorsValues[2])
        
        //Label
        
        redSliderValueLabel.text = String(format: "%.2f", redSlider.value)
        greenSliderValueLabel.text = String(format: "%.2f", greenSlider.value)
        blueSliderValueLabel.text = String(format: "%.2f",  blueSlider.value)
        
        //TextField
        
        redSliderTF.text = redSliderValueLabel.text
        greenSliderTF.text = greenSliderValueLabel.text
        blueSliderTF.text = blueSliderValueLabel.text
        
        redSliderTF.delegate = self
        greenSliderTF.delegate = self
        blueSliderTF.delegate = self
        
        addToolBarToTextFields(for: redSliderTF, greenSliderTF, blueSliderTF)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //MARK: - IB Actions
    @IBAction func redSliderChanged() {
        redSliderValueLabel.text = String(format: "%.2f", redSlider.value)
        redSliderTF.text = redSliderValueLabel.text
        changeViewBackgroundColor()
    }
    @IBAction func greenSliderChanged() {
        greenSliderValueLabel.text = String(format: "%.2f", greenSlider.value)
        greenSliderTF.text = greenSliderValueLabel.text
        changeViewBackgroundColor()
    }
    @IBAction func blueSliderChanged() {
        blueSliderValueLabel.text = String(format: "%.2f",  blueSlider.value)
        blueSliderTF.text = blueSliderValueLabel.text
        changeViewBackgroundColor()
    }
  
    @IBAction func doneButtonPressed() {
       
        delegate.setNewColor(
            for: redSlider.value,
            and: greenSlider.value,
            and: blueSlider.value)
        
        dismiss(animated: true)
    }
    
    //MARK: -Public Methods
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let value = Float(redSliderTF.text!) {
            redSlider.value = value
            redSliderValueLabel.text = redSliderTF.text
            changeViewBackgroundColor()
            view.endEditing(true)
        }
        if let value = Float(greenSliderTF.text!) {
            greenSlider.value = value
            greenSliderValueLabel.text = greenSliderTF.text
            changeViewBackgroundColor()
        }
        if let value = Float(blueSliderTF.text!) {
            blueSlider.value = value
            blueSliderValueLabel.text = blueSliderTF.text
            changeViewBackgroundColor()
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: - Private Methods
    private func changeViewBackgroundColor() {
        mainView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    private func addToolBarButton(for textField: UITextField) {
    let toolBar = UIToolbar()
    toolBar.sizeToFit()
    let button = UIBarButtonItem(
        title: "Done",
        style: .done,
        target: self,
        action: #selector(textFieldDidEndEditing(_:)))
        
    toolBar.setItems([button], animated: false)
    toolBar.isUserInteractionEnabled = true
    textField.inputAccessoryView = toolBar
    }
    
    private func addToolBarToTextFields(for textFields: UITextField...) {
        for textField in textFields {
            addToolBarButton(for: textField)
        }
    }
    
    
}


