//
//  SizeViewController.swift
//  coursera-interfaz-ios-week2
//
//  Created by Stefano Pezzino on 6/11/16.
//  Copyright © 2016 spezzino. All rights reserved.
//

import UIKit

class SizeViewController: UIViewController {
    
    @IBOutlet var image:UIImageView!
    @IBOutlet var textSize: UILabel!
    @IBOutlet var slider:UISlider!
    
    var stepsArray: NSArray = ["Chica","Mediana","Grande"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scaleImage(Float(0.25)*self.slider.value+0.5)
    }

    @IBAction func sliderValueChanged(slider:UISlider!){
        let index: Int = Int(slider.value + 0.5)
        slider.setValue(Float(index), animated: false)
        let size: String = self.stepsArray.objectAtIndex(index) as! String
        self.textSize.text = size
        
        scaleImage(Float(0.25)*slider.value+0.5)
    }
    
    func scaleImage(factor: Float){
        var b: CGRect = self.image.bounds
        b.size.height = CGFloat(240*factor)
        b.size.width = CGFloat(240*factor)
        self.image.bounds = b
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "BaseViewControllerSegue"){
            let pizza: Pizza = Pizza()
            pizza.size = self.stepsArray.objectAtIndex(Int(self.slider.value)) as! String
            
            let destinationVC = segue.destinationViewController as! BaseViewController
            
            destinationVC.pizza = pizza
        }
    }

}
