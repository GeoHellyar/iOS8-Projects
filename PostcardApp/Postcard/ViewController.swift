//
//  ViewController.swift
//  Postcard
//
//  Created by Brad Hellyar on 9/14/14.
//  Copyright (c) 2014 Brad Hellyar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var enterNameTextField: UITextField!
    @IBOutlet weak var enterMessageTextField: UITextField!
    @IBOutlet weak var mailButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendMailButtonPressed(sender: UIButton) {
        // Code will evaluate when we press the button
        if enterNameTextField.text != ""
        {
            //Update message text
            if enterMessageTextField.text == ""
            {
                messageLabel.text = "Please enter a message"
                messageLabel.textColor = UIColor.redColor()
                messageLabel.hidden = false
                mailButton.setTitle("Input Error", forState: UIControlState.Normal)
            }
            else
            {
                //Update message text
                messageLabel.text = "Your message, '" + enterMessageTextField.text + "' has been sent to " + enterNameTextField.text
//                messageLabel.textColor = UIColor(red: 48, green: 157, blue: 66, alpha: 1.0)
                
                messageLabel.hidden = false
                enterNameTextField.text = nil
                enterMessageTextField.text = nil
                enterMessageTextField.resignFirstResponder()
                messageLabel.textColor = UIColor.blueColor()
                mailButton.setTitle("Mail Sent", forState: UIControlState.Normal)
            }
        }
        else
        {
            //Update message text
            messageLabel.text = "Please enter an name"
            messageLabel.textColor = UIColor.redColor()
            messageLabel.hidden = false
            mailButton.setTitle("Input Error", forState: UIControlState.Normal)
        }
        
        
    }

}