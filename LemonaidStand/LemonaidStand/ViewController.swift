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
    @IBOutlet weak var numberOfIcePurchasedLabel: UILabel!
    @IBOutlet weak var suppliesCashLabel: UILabel!
    @IBOutlet weak var suppliesLemonsLabel: UILabel!
    @IBOutlet weak var suppliesIceLabel: UILabel!
    @IBOutlet weak var lemonsInMixLabel: UILabel!
    @IBOutlet weak var iceInMixLabel: UILabel!
    @IBOutlet weak var todaysRevenueLabel: UILabel!
    @IBOutlet weak var todaysCostsLabel: UILabel!
    @IBOutlet weak var todaysProfitLabel: UILabel!

    var lemonsPurchased: Int = 0
    var icePurchased: Int = 0
    var lemonSupplies: Int = 0
    var iceSupplies: Int = 0
    var cashSupplies: Int = 0
    var lemonsInMix: Int = 0
    var iceInMix: Int = 0
    
    let priceOfLemon = 2
    let priceOfIce = 1
    
    var lemonaidRatio:Float = 0.0
    var customerPref:[Float] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        hardReset()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buyLemonButtonPressed(sender: AnyObject)
    {
        if priceOfLemon <= cashSupplies
        {
            lemonSupplies += 1
            cashSupplies -= 2
            lemonsPurchased += 1
            
            updateMainView()
        }
        else
        {
            showAlertWithText(message: "Not enough cash, make other arraingments")
        }
    }
    @IBAction func sellLemonButtonPressed(sender: AnyObject)
    {
        if lemonSupplies > 0
        {
            lemonSupplies -= 1
            cashSupplies += 2
            lemonsPurchased -= 1
            
            updateMainView()
        }
        else
        {
            showAlertWithText(message: "You have no more Lemons to sell")
        }
    }
    @IBAction func buyIceButtonPressed(sender: AnyObject)
    {
        if priceOfIce <= cashSupplies
        {
            iceSupplies += 1
            cashSupplies -= 2
            icePurchased += 1
            
            updateMainView()
        }
        else
        {
            showAlertWithText(message: "Not enough cash, make other arraingments")
        }
    }
    @IBAction func sellIceButtonPressed(sender: AnyObject)
    {
        if iceSupplies > 0
        {
            iceSupplies -= 1
            cashSupplies += 2
            icePurchased -= 1
            
            updateMainView()
        }
        else
        {
            showAlertWithText(message: "You have no more Lemons to sell")
        }
    }

    @IBAction func moreLemonsInMixButtonPressed(sender: AnyObject)
    {
        if lemonSupplies > 0
        {
            lemonsInMix += 1
            lemonSupplies -= 1
            
            updateMainView()
        }
        else
        {
            showAlertWithText(message: "You have no more Lemons in Supplies")
        }
    }
    @IBAction func lessLemonsInMixButtonPressed(sender: AnyObject)
    {
        if lemonsInMix > 0
        {
            lemonsInMix -= 1
            lemonSupplies += 1
            
            updateMainView()
        }
        else
        {
            showAlertWithText(message: "Your Mix has no Lemons")
        }
    }
    @IBAction func moreIceInMixButtonPressed(sender: AnyObject)
    {
        if iceSupplies > 0
        {
            iceInMix += 1
            iceSupplies -= 1
            
            updateMainView()
        }
        else
        {
            showAlertWithText(message: "You have no more Ice in Supplies")
        }
    }
    @IBAction func lessIceInMixButtonPressed(sender: AnyObject)
    {
        if iceInMix > 0
        {
            iceInMix -= 1
            iceSupplies += 1
            
            updateMainView()
        }
        else
        {
            showAlertWithText(message: "Your Mix has no Ice")
        }
    }

    @IBAction func sellLemonaidButtonPressed(sender: AnyObject)
    {
        if lemonsInMix == 0
        {
            showAlertWithText(header: "Unable to Sell", message: "Add at least 1 lemon to your mix")
        }
//        else if iceInMix == 0
//        {
//            showAlertWithText(header: "Unable to Sell", message: "Add at least 1 ice to your mix")
//        }
        else
        {
            customerPref.removeAll(keepCapacity: false)
            
            lemonaidRatio = Float(lemonsInMix) / Float(iceInMix)
            println("Leomaind Ratio: \(lemonaidRatio)")
            
            customerPrefferenceCreation(10)
            gatherSalesForTheDay()
            
            lemonsInMix = 0
            iceInMix = 0
            lemonsPurchased = 0
            icePurchased = 0
            updateMainView()
            
        }
        
        
    }
    
    //Helper Functions
    func customerPrefferenceCreation(maxCustomers:Int) -> [Float]
    {
        let randNumbOfCustomersToday = Int(arc4random_uniform(UInt32(maxCustomers)))
        
        
        for (var i = 0; i <= randNumbOfCustomersToday; i++)
        {
            customerPref.append(Float(arc4random_uniform(UInt32(100))) / 100)
        }
        println(customerPref)
        return customerPref
    }
    
    func gatherSalesForTheDay()
    {
        var todaysCosts = lemonsInMix * 2 + iceInMix
        var todaysRevenue = 0
        var todaysCustomers = customerPref.count
        for (var i = 0; i < customerPref.count; i++)
        {
            if customerPref[i] < 0.4 && lemonaidRatio > 1
            {
                cashSupplies++
                todaysRevenue++
                println("\(customerPref[i]) Paid")
            }
            else if 0.41...0.6 ~= customerPref[i] && lemonaidRatio == 1
            {
                cashSupplies++
                todaysRevenue++
                println("\(customerPref[i]) Paid")
            }
            else if customerPref[i] > 0.6 && lemonaidRatio < 1
            {
                cashSupplies++
                todaysRevenue++
                println("\(customerPref[i]) Paid")
            }
            else
            {
                println("\(customerPref[i]) No Revenue")
            }
            todaysRevenueLabel.text = "Revenue: \(todaysRevenue)"
            todaysCostsLabel.text = "Costs: \(todaysCosts)"
            todaysProfitLabel.text = "Profits: \(todaysRevenue - todaysCosts)"
            
            updateMainView()
        }
    }
    
    func updateMainView ()
    {
        numberOfLemonsPuchasedLabel.text = "\(lemonsPurchased)"
        numberOfIcePurchasedLabel.text = "\(icePurchased)"
        suppliesCashLabel.text = "\(cashSupplies)"
        suppliesLemonsLabel.text = "\(lemonSupplies)"
        suppliesIceLabel.text = "\(iceSupplies)"
        lemonsInMixLabel.text = "\(lemonsInMix)"
        iceInMixLabel.text = "\(iceInMix)"
    }
    
    func hardReset ()
    {
        lemonsPurchased = 0
        icePurchased = 0
        lemonSupplies = 6
        iceSupplies = 9
        cashSupplies = 20
        lemonsInMix = 0
        iceInMix = 0
        
        updateMainView()
    }
    
    func showAlertWithText(header: String = "Warning", message: String)
    {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
}

