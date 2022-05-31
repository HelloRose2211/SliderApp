//
//  ViewController.swift
//  SliderApp
//
//  Created by Rose on 22.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewColor: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
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
        greenSlider.maximumTrackTintColor = .green
        
        setColor()
        setValue(for: redValueLabel)
        setValue(for: greenValueLabel)
        setValue(for: blueValueLabel)
    }


    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redValueLabel.text = string(from: redSlider)
        case greenSlider:
            greenValueLabel.text = string(from: greenSlider)
        default:
            blueValueLabel.text = string(from: blueSlider)
        }
    }

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

    private func string(from slider: UISlider) -> String {
            String(format: "%.2f", slider.value)
    }
}


