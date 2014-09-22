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
        
        nameLabel.text = myTiger.name
        ageLabel.text = "\(myTiger.age)"
        breedLabel.text = myTiger.breed
        myImageView.image = myTiger.image
        
        var secondTiger = Tiger(
            age: 2,
            name: "Tigress",
            breed: "Indochinese Tiger",
            image: UIImage(named:"IndochineseTiger.jpg")
        )
        var thirdTiger = Tiger(
            age: 4,
            name: "Jacob",
            breed: "Malayan Tiger",
            image: UIImage(named:"MalayanTiger.jpg")
        )
        var fourthTiger = Tiger(
            age: 6,
            name: "Spar",
            breed: "Siberian Tiger",
            image: UIImage(named:"SiberianTiger.jpg")
        )
        
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
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.nameLabel.text = self.tigerArray[self.tigerIndex].name
            self.ageLabel.text = "\(self.tigerArray[self.tigerIndex].age)"
            self.breedLabel.text = self.tigerArray[self.tigerIndex].breed
            self.myImageView.image = self.tigerArray[self.tigerIndex].image
            
            }, completion: {(finsihed: Bool) -> () in
        })
    }

}

