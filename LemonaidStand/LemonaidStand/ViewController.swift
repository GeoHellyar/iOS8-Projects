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
    @IBOutlet weak var todaysCustomersLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!

    var supplies = Supplies(aMoney: 10, aLemon: 1, aIceCube: 1)
    let price = Price()
    
    var lemonsPurchased: Int = 0
    var icePurchased: Int = 0
    var lemonsInMix: Int = 0
    var iceInMix: Int = 0
    
    var lemonaidRatio:Float = 0.0
    var customerPref:[Float] = []
    var additionalCustomers = 0
    
    var weatherArray: [[Int]] = [[-10,-9,-5,-7],[5,8,10,9],[22,25,27,23]]
    var weatherToday:[Int] = [0,0,0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        hardReset()
        simulateWeatherToday()
//        additionalCustomers = additionalCustomersFromWeather()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buyLemonButtonPressed(sender: AnyObject)
    {
        if price.lemon <= supplies.money
        {
            supplies.lemons += 1
            supplies.money -= 2
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
        if supplies.lemons > 0
        {
            supplies.lemons -= 1
            supplies.money += 2
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
        if price.iceCube <= supplies.money
        {
            supplies.iceCubes += 1
            supplies.money -= 1
            icePurchased += 1
            
            updateMainView()
        }
        else
        {
            showAlertWithText(message: "Not enough cash, make other arraingments")
        }
        checkIfGameOver()
    }
    @IBAction func sellIceButtonPressed(sender: AnyObject)
    {
        if supplies.iceCubes > 0
        {
            supplies.iceCubes -= 1
            supplies.money += 1
            icePurchased -= 1
            
            updateMainView()
        }
        else
        {
            showAlertWithText(message: "You have no more Ice to sell")
        }
        checkIfGameOver()
    }

    @IBAction func moreLemonsInMixButtonPressed(sender: AnyObject)
    {
        if supplies.lemons > 0
        {
            lemonsInMix += 1
            supplies.lemons -= 1
            
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
            supplies.lemons += 1
            
            updateMainView()
        }
        else
        {
            showAlertWithText(message: "Your Mix has no Lemons")
        }
    }
    @IBAction func moreIceInMixButtonPressed(sender: AnyObject)
    {
        if supplies.iceCubes > 0
        {
            iceInMix += 1
            supplies.iceCubes -= 1
            
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
            supplies.iceCubes += 1
            
            updateMainView()
        }
        else
        {
            showAlertWithText(message: "Your Mix has no Ice")
        }
    }

    @IBAction func sellLemonaidButtonPressed(sender: AnyObject)
    {
        let average = findAverage(weatherToday)
        if lemonsInMix == 0
        {
            showAlertWithText(header: "Unable to Sell", message: "Add at least 1 lemon to your mix")
        }
        else
        {
            customerPref.removeAll(keepCapacity: false)
            
            if iceInMix == 0
            {
                lemonaidRatio = Float(lemonsInMix)
            }
            else
            {
                lemonaidRatio = Float(lemonsInMix) / Float(iceInMix)
            }
            
            println("Leomaind Ratio: \(lemonaidRatio)")
            
            customerPrefferenceCreation(abs(average))
            gatherSalesForTheDay()
            
            lemonsInMix = 0
            iceInMix = 0
            lemonsPurchased = 0
            icePurchased = 0
            
//            additionalCustomers = additionalCustomersFromWeather()
            
            simulateWeatherToday()
            updateMainView()
            checkIfGameOver()
            
        }
        
        
    }
    
    //Helper Functions
//    func additionalCustomersFromWeather () -> Int
//    {
//        var additionalCustomers:Int = 0
//        let randWeather = Int(arc4random_uniform(UInt32(3)))
//        
//        switch randWeather
//        {
//        case 0:
//            weatherImageView.image = UIImage(named: "weatherCold")
//            additionalCustomers = -3
//        case 1:
//            weatherImageView.image = UIImage(named: "weatherMild")
//            additionalCustomers = 2
//        case 2:
//            weatherImageView.image = UIImage(named: "weatherWarm")
//            additionalCustomers = 5
//        default:
//            println("Check your random weather number")
//        }
//        
//        return additionalCustomers
//    }
    
    func customerPrefferenceCreation(maxCustomers:Int) -> [Float]
    {
        let randNumbOfCustomersToday = Int(arc4random_uniform(UInt32(maxCustomers)))
        
        for (var i = 0; i < randNumbOfCustomersToday; i++)
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
                supplies.money++
                todaysRevenue++
                println("\(customerPref[i]) Paid")
            }
            else if 0.41...0.6 ~= customerPref[i] && 0.85...1.15 ~= lemonaidRatio
            {
                supplies.money++
                todaysRevenue++
                println("\(customerPref[i]) Paid")
            }
            else if customerPref[i] > 0.6 && lemonaidRatio < 1
            {
                supplies.money++
                todaysRevenue++
                println("\(customerPref[i]) Paid")
            }
            else
            {
                println("\(customerPref[i]) No Revenue")
            }
            todaysRevenueLabel.text = "Revenue: $ \(todaysRevenue).00"
            todaysCostsLabel.text = "Costs: $ \(todaysCosts).00"
            todaysProfitLabel.text = "Profits: $ \(todaysRevenue - todaysCosts).00"
            todaysCustomersLabel.text = "Customers: \(todaysRevenue) / \(customerPref.count)"
            
            updateMainView()
        }
    }
    
    func updateMainView ()
    {
        numberOfLemonsPuchasedLabel.text = "\(lemonsPurchased)"
        numberOfIcePurchasedLabel.text = "\(icePurchased)"
        suppliesCashLabel.text = "\(supplies.money)"
        suppliesLemonsLabel.text = "\(supplies.lemons)"
        suppliesIceLabel.text = "\(supplies.iceCubes)"
        lemonsInMixLabel.text = "\(lemonsInMix)"
        iceInMixLabel.text = "\(iceInMix)"

    }
    
    func hardReset ()
    {
        lemonsPurchased = 0
        icePurchased = 0
        supplies.lemons = 1
        supplies.iceCubes = 1
        supplies.money = 10
        lemonsInMix = 0
        iceInMix = 0
        
        todaysCustomersLabel.text = "Customers: "
        todaysRevenueLabel.text = "Revenue: "
        todaysCostsLabel.text = "Costs: "
        todaysProfitLabel.text = "Profits: "
        
        updateMainView()
    }
    
    func checkIfGameOver()
    {
        if supplies.money <= 1 && supplies.lemons == 0 && lemonsInMix == 0 && iceInMix <= 1 && supplies.iceCubes <= 1
        {
            showAlertWithText(header: "Game Over", message: "You don't have enough supplies to continue, Try Again?")
            hardReset()
        }
    }
    
    func showAlertWithText(header: String = "Warning", message: String)
    {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func simulateWeatherToday() {
        let index = Int(arc4random_uniform(UInt32(weatherArray.count)))
        weatherToday = weatherArray[index]
        
        switch index {
        case 0:
            weatherImageView.image = UIImage(named: "weatherCold")
        case 1:
            weatherImageView.image = UIImage(named: "weatherMild")
        case 2:
            weatherImageView.image = UIImage(named: "weatherWarm")
        default:
            println("Check your random weather number")
        }
    }
    
    func findAverage(data:[Int]) -> Int {
        var sum = 0
        for x in data {
            sum += x
        }
        
        var average:Double = Double(sum) / Double(data.count)
        var rounded:Int = Int(ceil(average))
        return rounded
    }

}

