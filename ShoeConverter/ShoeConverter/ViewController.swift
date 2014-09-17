//
//  ViewController.swift
//  ShoeConverter
//
//  Created by Brad Hellyar on 9/17/14.
//  Copyright (c) 2014 Hell.ya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mensShoeSizeTextField: UITextField!
    @IBOutlet weak var mensShoeSizeConvertedLabel: UILabel!
    @IBOutlet weak var womenShoeSizeTextField: UITextField!
    @IBOutlet weak var womenShoeSizeConvertedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func convertButtonPressed(sender: UIButton)
    {
        let conversionConstant = 30;
        mensShoeSizeConvertedLabel.hidden = false
        mensShoeSizeConvertedLabel.text = "\(mensShoeSizeTextField.text.toInt()! + conversionConstant)" + " in European Shoe Size"
        
        mensShoeSizeTextField.resignFirstResponder()
    }
    
    @IBAction func convertWomensShowSizeButtonPressed(sender: UIButton)
    {
        let sizeFromTextField = Double((womenShoeSizeTextField.text as NSString).doubleValue)
        let conversionConstant = 30.5
        womenShoeSizeConvertedLabel.hidden = false
        womenShoeSizeConvertedLabel.text = "\(sizeFromTextField + conversionConstant)" + " in Eurpoean Shoe Size"
        
    }

}

