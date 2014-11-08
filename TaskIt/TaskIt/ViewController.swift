//
//  ViewController.swift
//  TaskIt
//
//  Created by Brad Hellyar on 11/4/14.
//  Copyright (c) 2014 SixAxis. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    var fetchedResultsController:NSFetchedResultsController = NSFetchedResultsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fetchedResultsController = getFetchResultsController()
        fetchedResultsController.delegate = self
        fetchedResultsController.performFetch(nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = tableView.indexPathForSelectedRow()
            let thisTask = fetchedResultsController.objectAtIndexPath(indexPath!) as TaskModel
            detailVC.detailTaskModel = thisTask

        }
        else if segue.identifier == "showAddTask" {
            let addTaskVC:AddTaskViewController = segue.destinationViewController as AddTaskViewController
        }
        
    }
    
    @IBAction func addButtonPressed(sender: UIBarButtonItem) {
        performSegueWithIdentifier("showAddTask", sender: self)
        
    }
    

    //UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fetchedResultsController.sections!.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fetchedResultsController.sections![section].numberOfObjects
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        let thisTask = fetchedResultsController.objectAtIndexPath(indexPath) as TaskModel
        
            cell.taskLabel.text = thisTask.task
            cell.descriptionLabel.text = thisTask.subtask
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
        
        let thisTask = fetchedResultsController.objectAtIndexPath(indexPath) as TaskModel
        println(thisTask.completed)
        
        var completeAction = UITableViewRowAction(style: .Default, title: "Complete", handler: { (action, indexPath) -> Void in
            thisTask.completed = true
            println(thisTask.completed)
            
            (UIApplication.sharedApplication().delegate as AppDelegate).saveContext()
        })
        completeAction.backgroundColor = UIColor(red: 98/255, green: 151/255, blue: 66/255, alpha: 1)
        
//        var postponeAWeekAction = UITableViewRowAction(style: .Default, title: "Postpone", handler: { (tvra:UITableViewRowAction!, indexPath:NSIndexPath!) ->
//            Void in
//            thisTask.completed = true
//            (UIApplication.sharedApplication().delegate as AppDelegate).saveContext()
//        })
//        postponeAWeekAction.backgroundColor = UIColor(red: 61/255, green: 154/255, blue: 233/255, alpha: 1)
        
        var uncompleteAction = UITableViewRowAction(style: .Default, title: "Uncomplete", handler: { (action, indexPath) -> Void in
            thisTask.completed = false
            println(thisTask.completed)
            (UIApplication.sharedApplication().delegate as AppDelegate).saveContext()
        })
        uncompleteAction.backgroundColor = UIColor(red: 233/255, green: 182/255, blue: 61/255, alpha: 1)
        
        var deleteAction = UITableViewRowAction(style: .Default, title: "Delete", handler: { (action, indexPath) -> Void in
            
//            self.managedObjectContext.deleteObject(thisTask)
            tableView.deleteRowsAtIndexPaths([indexPath.row], withRowAnimation: .Fade)
            (UIApplication.sharedApplication().delegate as AppDelegate).saveContext()

        })
        deleteAction.backgroundColor = UIColor(red: 203/255, green: 76/255, blue: 76/255, alpha: 1)
//        deleteAction.backgroundColor = UIColor(patternImage: UIImage(named:"sample")!)
        deleteAction.style
        
        if thisTask.completed == false {
            return [completeAction,deleteAction]
        } else {
            return [uncompleteAction,deleteAction]
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        //Must include for editActionsForRowAtIndexPath to show
    }
    
    //NSFetchResultsController Delegate
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }
    
    //Helper
    
    func taskFetchRequest() -> NSFetchRequest {
        
        let fetchRequest = NSFetchRequest(entityName: "TaskModel")
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        let completedDescriptor = NSSortDescriptor(key: "completed", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor, completedDescriptor]
        
        return fetchRequest
    }
    
    func getFetchResultsController() -> NSFetchedResultsController {
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext: managedObjectContext!, sectionNameKeyPath: "completed", cacheName: nil)
        
        return fetchedResultsController
    }
    
    func isAllComplete() -> Bool {
        var ret:Bool = false
        if fetchedResultsController.sections!.count == 1 {
            if fetchedResultsController.sections![0].numberOfObjects > 0 {
                var indexPath = NSIndexPath(forItem: 0, inSection: 0)
                var task = fetchedResultsController.objectAtIndexPath(indexPath) as TaskModel
                ret = task.completed.boolValue
            }
        }
        return ret
    }
}

