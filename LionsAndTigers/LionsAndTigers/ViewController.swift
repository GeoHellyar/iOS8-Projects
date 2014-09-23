//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Brad Hellyar on 9/21/14.
//  Copyright (c) 2014 Hellyar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    var tigerArray:[Tiger] = []
    var tigerIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger(
            age: 3,
            name: "Tigger",
            breed: "Bengal",
            image: UIImage(named:"BengalTiger.jpg")
        )
        
        myTiger.chuffANumberOfTimes(3)
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
        nameLabel.text = myTiger.name
        ageLabel.text = "\(myTiger.age)"
        breedLabel.text = myTiger.breed
        myImageView.image = myTiger.image
        randomFactLabel.text = myTiger.randomFact()
        
        var secondTiger = Tiger(
            age: 2,
            name: "Tigress",
            breed: "Indochinese Tiger",
            image: UIImage(named:"IndochineseTiger.jpg")
        )
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        var thirdTiger = Tiger(
            age: 4,
            name: "Jacob",
            breed: "Malayan Tiger",
            image: UIImage(named:"MalayanTiger.jpg")
        )
        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)
        
        var fourthTiger = Tiger(
            age: 6,
            name: "Spar",
            breed: "Siberian Tiger",
            image: UIImage(named:"SiberianTiger.jpg")
        )
        fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)
        fourthTiger.chuffANumberOfTImes(3, isLoud: false)
        
        
        tigerArray += [myTiger, secondTiger, thirdTiger, fourthTiger]
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonPressed(sender: UIBarButtonItem) {
        if tigerIndex > tigerArray.count - 2
        {
            tigerIndex = 0
        }
        else
        {
            tigerIndex++
        }
        
        let tiger = self.tigerArray[self.tigerIndex]
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.nameLabel.text = tiger.name
            self.ageLabel.text = "\(tiger.age)"
            self.breedLabel.text = tiger.breed
            self.myImageView.image = tiger.image
            
            }, completion: {(finsihed: Bool) -> () in
        })
        
        self.randomFactLabel.text = tiger.randomFact()
    }
}

