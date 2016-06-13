//
//  CheeseViewController.swift
//  coursera-interfaz-ios-week2
//
//  Created by Stefano Pezzino on 6/11/16.
//  Copyright © 2016 spezzino. All rights reserved.
//

import UIKit

class CheeseViewController: UIViewController {
    
    @IBOutlet weak var c1: DLRadioButton!
    
    var pizza: Pizza!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func checkSelection() -> Bool {
        if(c1.selectedButton() == nil){
            return false
        }
        
        return true
    }
    
    @IBAction func next(){
        if(!checkSelection()){
            let alert = UIAlertController(title: "Atención", message: "Debes elegir un tipo de queso", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        performSegueWithIdentifier("IngredientsViewControllerSegue", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "IngredientsViewControllerSegue"){
            self.pizza.cheese = self.c1.selectedButton()!.titleLabel!.text!
            
            let destinationVC = segue.destinationViewController as! IngredientsViewController
            
            destinationVC.pizza = self.pizza
        }
    }
}
