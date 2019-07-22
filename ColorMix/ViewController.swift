//
//  ViewController.swift
//  ColorMix
//
//  Created by Fernando on 14/05/2019.
//  Copyright © 2019 Fernando Salvador. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    func updateColor(){
        var red:CGFloat = 0
        var blue:CGFloat = 0
        var green:CGFloat = 0
        
        if redSwitch.isOn{
            red = CGFloat(redSlide.value)
        }
        if blueSwitch.isOn{
            blue = CGFloat(blueSlide.value)
        }
        if greenSwitch.isOn{
            green = CGFloat(greenSlide.value)
        }
        let color = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1)
        colorView.backgroundColor = color
    }
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        colorView.layer.borderWidth = 5
        colorView.layer.cornerRadius = 20
        colorView.layer.borderColor = UIColor.black.cgColor
        updateColor()
        updateControl()
    }
    func updateControl(){
        redSlide.isEnabled = redSwitch.isOn
        blueSlide.isEnabled = blueSwitch.isOn
        greenSlide.isEnabled = greenSwitch.isOn
    }

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var redSlide: UISlider!
    @IBOutlet weak var blueSlide: UISlider!
    @IBOutlet weak var greenSlide: UISlider!
    
    @IBAction func swichChanged(_ sender: UISwitch) {
       updateColor()
       updateControl()
    }
    @IBAction func slideChange(_ sender: UISlider) {
        updateColor()
    }
    @IBAction func reset(_ sender: UIButton) {
        redSlide.value = 1
        blueSlide.value = 1
        greenSlide.value = 1
        redSwitch.isOn = false
        blueSwitch.isOn = false
        greenSwitch.isOn = false
        updateColor()
        updateControl()
    }
}

