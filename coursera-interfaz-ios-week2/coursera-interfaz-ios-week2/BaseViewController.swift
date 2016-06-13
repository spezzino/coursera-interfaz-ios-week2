//
//  BaseViewController.swift
//  coursera-interfaz-ios-week2
//
//  Created by Stefano Pezzino on 6/11/16.
//  Copyright © 2016 spezzino. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet var image:UIImageView!
    @IBOutlet var textSize: UILabel!
    @IBOutlet var slider:UISlider!
    
    var pizza: Pizza!
    
    var stepsArray: NSArray = ["Delgada","Crujiente","Gruesa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sliderValueChanged(slider:UISlider!){
        let index: Int = Int(slider.value + 0.5)
        slider.setValue(Float(index), animated: false)
        let size: String = self.stepsArray.objectAtIndex(index) as! String
        self.textSize.text = size
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "CheeseViewControllerSegue"){
            pizza.base = self.stepsArray.objectAtIndex(Int(self.slider.value)) as! String
            
            let destinationVC = segue.destinationViewController as! CheeseViewController
            
            destinationVC.pizza = self.pizza
        }
    }
}
