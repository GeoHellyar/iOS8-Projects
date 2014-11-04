//
//  ViewController.swift
//  TaskIt
//
//  Created by Brad Hellyar on 11/4/14.
//  Copyright (c) 2014 SixAxis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var taskArray:[Dictionary<String,String>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let task1:Dictionary<String,String> = ["task": "Study French", "subtask": "Verbs", "date": "10/05/2014"]
        let task2:Dictionary<String,String> = ["task": "Watch Kids", "subtask": "Play Ninjas", "date": "10/15/2014"]
        let task3:Dictionary<String,String> = ["task": "Learn Swift", "subtask": "xCode 6", "date": "10/02/2014"]
        taskArray = [task1,task2,task3]
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        let taskDict:Dictionary = taskArray[indexPath.row]
        
            cell.taskLabel.text = taskDict["task"]
            cell.descriptionLabel.text = taskDict["subtask"]
            cell.taskDateLabel.text = taskDict["date"]
    
        return cell
    }
    
    //UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}

