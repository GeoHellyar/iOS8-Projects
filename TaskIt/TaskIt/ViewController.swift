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
    
    var baseArray:[[TaskModel]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let date1 = Date.from(year: 2014, month: 05, day: 20)
        let date2 = Date.from(year: 2014, month: 03, day: 03)
        let date3 = Date.from(year: 2014, month: 02, day: 21)
        
        let task1 = TaskModel(task: "Study French", subTask: "Verbs", date: date1, isCompleted:false)
        let task2 = TaskModel(task: "Learn to Code", subTask: "Swift", date: date2, isCompleted:false)
        
        let taskArray = [
            task1,
            task2,
            TaskModel(task: "Hit the Town", subTask: "Movie: Hero 6", date: date3, isCompleted:false)
        ]
        var completedTaskArray = [TaskModel(task: "Code", subTask: "iOS", date: date3, isCompleted: true)]
        
        baseArray = [taskArray, completedTaskArray]
        
        tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        baseArray[0] = baseArray[0].sorted{
            (taskOne:TaskModel, taskTwo:TaskModel) in return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
        }
        
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
            let thisTask = baseArray[indexPath!.section][indexPath!.row]
            detailVC.detailTaskModel = thisTask
            detailVC.mainVC = self
        }
        else if segue.identifier == "showAddTask" {
            let addTaskVC:AddTaskViewController = segue.destinationViewController as AddTaskViewController
            addTaskVC.mainVC = self
        }
        
    }
    
    @IBAction func addButtonPressed(sender: UIBarButtonItem) {
        performSegueWithIdentifier("showAddTask", sender: self)
        
    }
    

    //UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return baseArray.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return baseArray[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        let thisTask = baseArray[indexPath.section][indexPath.row]
        
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
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "TO DO"
        } else {
            return "COMPLETED"
        }
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        let thisTask = self.baseArray[indexPath.section][indexPath.row]
        var newTask = TaskModel(task: thisTask.task, subTask: thisTask.subTask, date: thisTask.date, isCompleted: !thisTask.isCompleted)
        var completeAction:UITableViewRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Complete", handler: { (tvra:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            self.baseArray[indexPath.section].removeAtIndex(indexPath.row)
            self.baseArray[1].append(newTask)
            tableView.reloadData()
        })
        completeAction.backgroundColor = UIColor(red: 98/255, green: 151/255, blue: 66/255, alpha: 1)
        
        var postponeAWeekAction:UITableViewRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Postpone", handler: { (tvra:UITableViewRowAction!, indexPath:NSIndexPath!) ->
            Void in
            self.baseArray[indexPath.section].removeAtIndex(indexPath.row)
            self.baseArray[1].append(newTask)
            tableView.reloadData()
        })
        postponeAWeekAction.backgroundColor = UIColor(red: 61/255, green: 154/255, blue: 233/255, alpha: 1)
        
        var uncompleteAction:UITableViewRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Uncomplete", handler: { (tvra:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            self.baseArray[indexPath.section].removeAtIndex(indexPath.row)
            self.baseArray[0].append(newTask)
            tableView.reloadData()
        })
        uncompleteAction.backgroundColor = UIColor(red: 233/255, green: 182/255, blue: 61/255, alpha: 1)
        
        var deleteAction:UITableViewRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler: { (tvra:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            self.baseArray[indexPath.section].removeAtIndex(indexPath.row)
            tableView.reloadData()
        })
        deleteAction.backgroundColor = UIColor(red: 203/255, green: 76/255, blue: 76/255, alpha: 1)
        
        if indexPath.section == 0 {
            return [completeAction,postponeAWeekAction,deleteAction]
        } else {
            return [uncompleteAction,deleteAction]
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let thisTask = baseArray[indexPath.section][indexPath.row]
        
        if indexPath.section == 0 {
            var newTask = TaskModel(task: thisTask.task, subTask: thisTask.subTask, date: thisTask.date, isCompleted:true)
            baseArray[1].append(newTask)
        } else {
            var newTask = TaskModel(task: thisTask.task, subTask: thisTask.subTask, date: thisTask.date, isCompleted:false)
            baseArray[0].append(newTask)
        }
        baseArray[indexPath.section].removeAtIndex(indexPath.row)
        tableView.reloadData()
    }
    
}

