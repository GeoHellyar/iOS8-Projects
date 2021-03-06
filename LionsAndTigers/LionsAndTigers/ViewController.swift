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
    
    var lionsArray:[Lion] = []
    var lionCubsArray:[LionCub] = []
    
    var currentAnimal = (species:"Tiger", index:0)
    
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
      
        var lion = Lion()
        lion.age = 4
        lion.name = "Alex"
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.subSpecies = "New York Giant"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.name = "Jezabel"
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.subSpecies = "Barbary"
        
        lionsArray += [lion, lioness]
        lioness.roar()
        lion.changeToAlphaMale()
        
        var lionCub = LionCub()
        lionCub.age = 1
        lionCub.name = "Simba"
        lionCub.image = UIImage(named:"LionCub1.jpg")
        lionCub.subSpecies = "Masai"
        lionCub.isMale = true
        
        
        var lionessCub = LionCub()
        lionessCub.age = 2
        lionessCub.name = "Nalla"
        lionessCub.image = UIImage(named:"LionCub2.jpeg")
        lionessCub.subSpecies = "Transval"
        lionessCub.isMale = false
        
        lionCubsArray += [lionCub, lionessCub]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateAnimal ()
    {
        switch currentAnimal {
        case ("Tiger", _ ):
            let randomIndex = Int(arc4random_uniform(UInt32(lionsArray.count)))
            currentAnimal = ("Lion", randomIndex)
        case ("Lion", _ ):
            let randomIndex = Int(arc4random_uniform(UInt32(lionCubsArray.count)))
            currentAnimal = ("LionCub", randomIndex)
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(tigerArray.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
    }
    
    func updateView ()
    {
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            if self.currentAnimal.species == "Tiger"
            {
                let tiger = self.tigerArray[self.currentAnimal.index]
                self.myImageView.image = tiger.image
                self.breedLabel.text = tiger.breed
                self.ageLabel.text = "\(tiger.age)"
                self.nameLabel.text = tiger.name
                self.randomFactLabel.text = tiger.randomFact()
            }
            else if self.currentAnimal.species == "Lion"
            {
                let lion = self.lionsArray[self.currentAnimal.index]
                self.myImageView.image = lion.image
                self.breedLabel.text = lion.subSpecies
                self.ageLabel.text = "\(lion.age)"
                self.nameLabel.text = lion.name
                self.randomFactLabel.text = lion.randomFact()
            }
            else if self.currentAnimal.species == "LionCub"
            {
                let lionCub = self.lionCubsArray[self.currentAnimal.index]
                self.myImageView.image = lionCub.image
                self.breedLabel.text = lionCub.subSpecies
                self.ageLabel.text = "\(lionCub.age)"
                self.nameLabel.text = lionCub.name
                self.randomFactLabel.text = lionCub.randomFact()
            }
            
            }, completion: {(finsihed: Bool) -> () in
        })
    }

    @IBAction func nextBarButtonPressed(sender: UIBarButtonItem)
    {
        updateAnimal()
        updateView()
    }
    
    func updateTiger () {
        if tigerIndex > tigerArray.count - 2
        {
            tigerIndex = 0
        }
        else
        {
            tigerIndex++
        }
        
        let tiger = self.tigerArray[self.tigerIndex]
        
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.nameLabel.text = tiger.name
            self.ageLabel.text = "\(tiger.age)"
            self.breedLabel.text = tiger.breed
            self.myImageView.image = tiger.image
            
            }, completion: {(finsihed: Bool) -> () in
        })
        
        self.randomFactLabel.text = tiger.randomFact()
    }
}

