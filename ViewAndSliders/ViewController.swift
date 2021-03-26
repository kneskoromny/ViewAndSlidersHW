//
//  ViewController.swift
//  ViewAndSliders
//
//  Created by Кирилл Нескоромный on 26.03.2021.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var redSliderValueLabel: UILabel!
    @IBOutlet weak var greenSliderValueLabel: UILabel!
    @IBOutlet weak var blueSliderValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // View
        mainView.layer.cornerRadius = 20
        mainView.backgroundColor = .init(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        
        //Label
        redSliderValueLabel.text = ""
        greenSliderValueLabel.text = ""
        blueSliderValueLabel.text = ""
        
        // Slider
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }
    
    //MARK: - IB Actions
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
    
    //MARK: - Private Methods
    private func changeViewBackgroundColor() {
        mainView.backgroundColor = .init(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
}

