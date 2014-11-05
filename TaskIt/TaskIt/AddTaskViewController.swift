//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by Brad Hellyar on 11/5/14.
//  Copyright (c) 2014 SixAxis. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var duedatePicker: UIDatePicker!
    
    var mainVC: ViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func addTaskButtonPressed(sender: UIButton) {
        var task = TaskModel(task: taskTextField.text, subTask: descriptionTextField.text, date: duedatePicker.date)
        mainVC.taskArray.append(task)
        dismissViewControllerAnimated(true, completion: nil)
    }

}
