//
//  IngredientsViewController.swift
//  coursera-interfaz-ios-week2
//
//  Created by Stefano Pezzino on 6/11/16.
//  Copyright © 2016 spezzino. All rights reserved.
//

import UIKit

class IngredientsViewController: UIViewController {
    
    @IBOutlet weak var c1: DLRadioButton!
    
    var pizza: Pizza!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        c1.multipleSelectionEnabled = true
    }
    
    func checkSelection() -> Bool {
        if(self.c1.selectedButtons().count < 1 || self.c1.selectedButtons().count > 5){
            return false
        }
        
        return true
    }
    
    @IBAction func next(){
        if(!checkSelection()){
            let alert = UIAlertController(title: "Atención", message: "Debes elegir de 1 a 5 ingredientes", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        performSegueWithIdentifier("ConfirmationViewControllerSegue", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "ConfirmationViewControllerSegue"){
            var ingredients: Array<String> = Array()
            for button in c1.selectedButtons() {
                ingredients.append((button.titleLabel?.text)!)
            }
            
            self.pizza.ingredients = ingredients
            
            let destinationVC = segue.destinationViewController as! ConfirmationViewController
            
            destinationVC.pizza = self.pizza
        }
    }
}
