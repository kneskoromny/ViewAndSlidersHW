//
//  ViewController.swift
//  ViewAndSliders
//
//  Created by Кирилл Нескоромный on 26.03.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var redSliderValueLabel: UILabel!
    @IBOutlet weak var greenSliderValueLabel: UILabel!
    @IBOutlet weak var blueSliderValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    // передаю цвет с главного экрана через сегвей
    var mainViewColor: UIColor!
    // объявляю свойство делегатом протокола и инициализируем его,
    // у него есть нужный метод setNewСolor, delegate теперь является ссылкой на класс MainViewController (на тот extension, где есть метод setNewColor)
    var delegate: SettingsViewControllerDelegate! //протокол - тип данных, как и любой другой String, Int и тд
    
    
    
    
    
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // View
        
        mainView.layer.cornerRadius = mainView.frame.height / 7
        // присваиваю аутлету mainView цвет, переданный по сегвею
        mainView.backgroundColor = mainViewColor
        // создаю массив из значений RGBA текущего цвета View
        let colorsValues = (mainViewColor.cgColor.components)!
        
        
        // Slider
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        // присваиваю значения текущих цветов для каждого слайдера
        redSlider.value = Float(colorsValues[0])
        greenSlider.value = Float(colorsValues[1])
        blueSlider.value = Float(colorsValues[2])
        
        //Label
        
        redSliderValueLabel.text = String(format: "%.2f", redSlider.value)
        greenSliderValueLabel.text = String(format: "%.2f", greenSlider.value)
        blueSliderValueLabel.text = String(format: "%.2f",  blueSlider.value)
        
        
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
  
    @IBAction func doneButtonPressed() {
        // перед тем, как закрыть экран должны вызвать метод setNewColor,
        // чтобы передать цвета,
        delegate.setNewColor(
            for: redSlider.value,
            and: greenSlider.value,
            and: blueSlider.value)
        //закрываем экран
        dismiss(animated: true)
    }
    
    //MARK: - Private Methods
    private func changeViewBackgroundColor() {
        mainView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
   
}


