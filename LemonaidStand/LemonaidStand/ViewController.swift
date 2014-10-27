//
//  ViewController.swift
//  LemonaidStand
//
//  Created by Brad Hellyar on 10/6/14.
//  Copyright (c) 2014 Hellyar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberOfLemonsPuchasedLabel: UILabel!
    @IBOutlet weak var numberOfIcePurchesedLabel: UILabel!
    @IBOutlet weak var suppliesCashLabel: UILabel!
    @IBOutlet weak var suppliesLemonsLabel: UILabel!
    @IBOutlet weak var suppliesIceLabel: UILabel!
    @IBOutlet weak var lemonsInMixLable: UILabel!
    @IBOutlet weak var iceInMixLabel: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buyLemonButtonPressed(sender: AnyObject) {
    }
    @IBAction func sellLemonButtonPressed(sender: AnyObject) {
    }
    @IBAction func buyIceButtonPressed(sender: AnyObject) {
    }
    @IBAction func sellIceButtonPressed(sender: AnyObject) {
    }

    @IBAction func moreLemonsInMixButtonPressed(sender: AnyObject) {
    }
    @IBAction func lessLemonsInMixButtonPressed(sender: AnyObject) {
    }
    @IBAction func moreIceInMixButtonPressed(sender: AnyObject) {
    }
    @IBAction func lessIceInMixButtonPressed(sender: AnyObject) {
    }

    @IBAction func sellLomonaidButtonPressed(sender: AnyObject) {
    }
}

