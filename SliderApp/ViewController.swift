//
//  ViewController.swift
//  SliderApp
//
//  Created by Rose on 22.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewColor: UIView!
    
    @IBOutlet weak var redValueLabel: UIStackView!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewColor.layer.cornerRadius = 10
    
                
        // Slider
        
        redSlider.minimumTrackTintColor = .red
        redSlider.maximumTrackTintColor = .white
    
        greenSlider.minimumTrackTintColor = .green
        greenSlider.maximumTrackTintColor = .white
        
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.maximumTrackTintColor = .white
        
        setColor()
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
        }
    }


    @IBAction func rgbSlider(_ sender: UISlider) {
        switch sender {
        case redSlider:
            setValue(for: redValueLabel)
        case greenSlider:
            setValue(for: greenValueLabel)
        default:
            setValue(for: blueValueLabel)
        }
    }
}

extension ViewController {
    
    private func setColor() {
        viewColor.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redValueLabel:
                redValueLabel.text = string(from: redSlider)
            case greenValueLabel:
                greenValueLabel.text = string(from: greenSlider)
            default:
                blueValueLabel.text = string(from: blueSlider)
            }
        }
    }
    
   
    private func setSliders() {
        let ciColor = CIColor(color: UIColor)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}


