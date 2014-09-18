//
//  ViewController.swift
//  AgeofLaika
//
//  Created by Brad Hellyar on 9/18/14.
//  Copyright (c) 2014 Hellyar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var humanYearsTextField: UITextField!
    @IBOutlet weak var dogYearsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func covertToDogYearsBtnPressed(sender: UIButton)
    {
        var humanYears = Double((humanYearsTextField.text as NSString).doubleValue)
        var dogYears:Double
        
        if humanYears < 2
        {
            dogYears = humanYears * 10.5
        }
        else
        {
            let yearsOlderThan2 = humanYears - 2
            dogYears = 21 + yearsOlderThan2 * 4
            
        }
        dogYearsLabel.text = "Your " + humanYearsTextField.text + " year old dog is really \(dogYears) years old in dog years"
        dogYearsLabel.hidden = false
        humanYearsTextField.resignFirstResponder()
    }

}

