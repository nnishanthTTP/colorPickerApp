//
//  ViewController.swift
//  colorPicker
//
//  Created by Nidhin Nishanth on 4/22/23.
//

/*
Keyboard Shortcuts for this Project
 - Control + Option + Command + Return to open the assistant editor
 - Control-Drag (hold the control key, then click and drag) from an Storyboard element to this Swift file to make a connection
 - Command + '/' to comment out lines of code
 */

import UIKit

class ViewController: UIViewController {

    // In this project, we need to make a few connections from the elements in our storyboard to this Swift file.

    // MARK: Outlet Connections
    // Outlets allow you to connect the UI elements on the storyboard to code, which makes it easy to access some of their properties. Making an outlet connection creates a variable for the UI element.
    
    // This is the view at the top
    @IBOutlet var colorView: UIView!
    
    // These are each of the switches
    @IBOutlet var redSwitch: UISwitch!
    @IBOutlet var greenSwitch: UISwitch!
    @IBOutlet var blueSwitch: UISwitch!
    
    // These are each of the sliders
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    // MARK: viewDidLoad
    // This override function will run everytime we load this app
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // We'll give our view a border so we can see it easily
        colorView.layer.borderWidth = 5
        colorView.layer.cornerRadius = 20
        colorView.layer.borderColor = UIColor.black.cgColor
        
        // When we load our app, we'll call the functions to update our color and our controls
        updateColor()
        updateControls()
    }

    
    // MARK: Action Connections
    // Actions allow the UI elements to trigger a function.
    
    
    // This function will run whenever we click the Reset button. It'll turn off the switches and set the sliders to their default values, then updates the color and controls
    @IBAction func reset(_ sender: UIButton) {
        redSwitch.isOn = false
        greenSwitch.isOn = false
        blueSwitch.isOn = false
        
        redSlider.value = 1
        greenSlider.value = 1
        blueSlider.value = 1
        
        updateColor()
        updateControls()
    }
    
    
    // This function will take input from a slider, and if we change the value of the slider, we'll update the color accordingly
    @IBAction func sliderChanged(_ sender: UISlider) {
        updateColor()
    }

    
    // Same as 'sliderChanged', except here we will also update the controls.
    @IBAction func switchChanged(_ sender: UISwitch) {
        updateColor()
        updateControls()
    }
    
    
    // This function will turn off the sliders if the corresponding switches are turned off
    func updateControls() {
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
    }
    
    // This function will create a color for our colorView. We take the values of the sliders, and use them to set the Red, Green, and Blue values of our color.
    func updateColor() {
        // To create a color, we need to enter in rgb values as CGFloats
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        // If the switch is on, we'll turn on the color. We need to convert the value of the slider to a CGFloat.
        if redSwitch.isOn {
            red = CGFloat(redSlider.value)
        }
        if greenSwitch.isOn {
            green = CGFloat(greenSlider.value)
        }
        if blueSwitch.isOn {
            blue = CGFloat(greenSlider.value)
        }
        
        // We'll take those red, green, and blue values and make a color from it
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colorView.backgroundColor = color
        
    }

}

