//
//  MainViewController.swift
//  ViewAndSliders
//
//  Created by Кирилл Нескоромный on 09.04.2021.
//

import UIKit

// протокол объявляется в том классе, где он будет реализован, куда будут передаваться данные
protocol SettingsViewControllerDelegate {
    func setNewColor(for redSliderValue: Float, and greenSliderValue: Float, and blueSliderValue: Float)
}

class MainViewController: UIViewController {

    
    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.backgroundColor = UIColor(
            red: 255/255,
            green: 255/255,
            blue: 255/255,
            alpha: 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingsVC = segue.destination as? SettingsViewController {
            settingsVC.mainViewColor = view.backgroundColor
            //инициализирую свойство классом MainViewController, тк он подписан на этот тип данных
            settingsVC.delegate = self
        }
    }

}
// здесь реализовали метод протокола, показали как использовать параметры, которые получим - передадим их в свойство UIColor
// теперь класс имеет тип данных SettingsViewController

extension MainViewController: SettingsViewControllerDelegate {
    func setNewColor(for redSliderValue: Float, and greenSliderValue: Float, and blueSliderValue: Float) {
        mainView.backgroundColor = UIColor(
            red: CGFloat(redSliderValue),
            green: CGFloat(greenSliderValue),
            blue: CGFloat(blueSliderValue),
            alpha: 1)
    }
    
    
}




