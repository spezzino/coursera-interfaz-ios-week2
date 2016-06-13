//
//  ConfirmationViewController.swift
//  coursera-interfaz-ios-week2
//
//  Created by Stefano Pezzino on 6/11/16.
//  Copyright © 2016 spezzino. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {
    @IBOutlet var sizeLabel: UILabel!
    @IBOutlet var baseLabel: UILabel!
    @IBOutlet var cheeseLabel: UILabel!
    @IBOutlet var ingredientsText: UITextView!
    
    var pizza: Pizza!
    
    override func viewDidLoad() {
        self.sizeLabel.text?.appendContentsOf(" \(pizza.size)")
        self.baseLabel.text?.appendContentsOf(" \(pizza.base)")
        self.cheeseLabel.text?.appendContentsOf(" \(pizza.cheese)")
        
        self.ingredientsText.text = pizza.ingredients.componentsJoinedByString("\n")
        
        pizza.toString()
    }
}
