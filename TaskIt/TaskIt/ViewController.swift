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
    
    var taskArray:[TaskModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let date1 = Date.from(year: 2014, month: 05, day: 20)
        let date2 = Date.from(year: 2014, month: 03, day: 03)
        let date3 = Date.from(year: 2014, month: 02, day: 21)
        
        let task1 = TaskModel(task: "Study French", subTask: "Verbs", date: date1)
        let task2 = TaskModel(task: "Learn to Code", subTask: "Swift", date: date2)
        
        taskArray = [
            task1,
            task2,
            TaskModel(task: "Hit the Town", subTask: "Movie: Hero 6", date: date3)
        ]
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = tableView.indexPathForSelectedRow()
            let thisTask = taskArray[indexPath!.row]
            detailVC.detailTaskModel = thisTask
        }
        
    }
    
    @IBAction func addButtonPressed(sender: UIBarButtonItem) {
        performSegueWithIdentifier("showAddTask", sender: self)
        
    }
    

    //UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        let thisTask = taskArray[indexPath.row]
        
            cell.taskLabel.text = thisTask.task
            cell.descriptionLabel.text = thisTask.subTask
            cell.taskDateLabel.text = Date.toString(date: thisTask.date)
    
        return cell
    }
    
    //UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        println(indexPath.row)
        
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
}

