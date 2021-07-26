//
//  TimerViewController.swift
//  RSTask8Final
//
//  Created by Gleb Tregubov on 19.07.2021.
//

import UIKit

class TimerViewController: HalfScreenSuperViewController {
    
    @objc var drawingView:DrawingView = DrawingView()
    
    let currentSliderValueLabel: UILabel = UILabel(frame: CGRect(x: 162, y: 161, width: 52, height: 22))

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuringSlide()
        // Do any additional setup after loading the view.
    }
    
    func configuringSlide() {
        let slider: UISlider = UISlider(frame: CGRect(x: 74.0, y: 112.0, width: 223.0, height: 4.0))
        slider.addTarget(self, action: #selector(self.sliderValueChanged), for: UIControl.Event.valueChanged)
        slider.minimumValue = 1.0
        slider.maximumValue = 5.0
        slider.tintColor = UIColor.init(named: "Light Green Sea")
        
        currentSliderValueLabel.font = UIFont(name: "Montserrat-Regular", size: 18.0)
        currentSliderValueLabel.text = "\(1.0)"
        currentSliderValueLabel.textAlignment = .center
        
        
        let maximumSliderValueLabel: UILabel = UILabel(frame: CGRect(x: 338, y: 103, width: 11, height: 22))
        maximumSliderValueLabel.text = "\(slider.maximumValue)"
        maximumSliderValueLabel.font = UIFont(name: "Montserrat-Regular", size: 18.0)
        maximumSliderValueLabel.textAlignment = .center
        
        let minimumSliderValueLabel: UILabel = UILabel(frame: CGRect(x: 26, y: 103, width: 7, height: 22))
        minimumSliderValueLabel.text = "\(slider.minimumValue)"
        minimumSliderValueLabel.font = UIFont(name: "Montserrat-Regular", size: 18.0)
        minimumSliderValueLabel.textAlignment = .center
        
        self.view.addSubview(slider)
        self.view.addSubview(currentSliderValueLabel)
        self.view.addSubview(maximumSliderValueLabel)
        self.view.addSubview(minimumSliderValueLabel)
    }
    
    @objc func sliderValueChanged(sender: UISlider) {
        currentSliderValueLabel.text = String(format: "%0.02f", sender.value)
        self.drawingView.drawingSpeed = 1.0 / ( 60.0 * sender.value)
        print(self.drawingView.drawingSpeed)
    }

}
