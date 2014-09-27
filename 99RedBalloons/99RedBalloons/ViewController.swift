//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Brad Hellyar on 9/23/14.
//  Copyright (c) 2014 Hellyar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberOfBalloonsLabel: UILabel!
    @IBOutlet weak var balloonImageView: UIImageView!
    
    var balloonArray:[Balloon] = []
    var balloonIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        create99Balloons()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBalloonPressed(sender: UIButton) {
        println(balloonArray.count)
        if balloonIndex > balloonArray.count - 2
        {
            balloonIndex = 0
        }
        else
        {
            balloonIndex++
        }
        
        let balloon = self.balloonArray[self.balloonIndex]
        
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionNone, animations:
            {
                
                self.numberOfBalloonsLabel.text = "\(balloon.balloonNumber)"
                self.balloonImageView.image = balloon.balloonImage
                
            }, completion: {(finished: Bool) -> () in})
        
    }
    @IBAction func previousBalloonPressed(sender: UIButton) {
        if balloonIndex < 1
        {
            balloonIndex = 99
        }
        else
        {
            balloonIndex--
        }
        println(balloonIndex)
        let balloon = self.balloonArray[self.balloonIndex]
        
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionNone, animations:
            {
                
                self.numberOfBalloonsLabel.text = "\(balloon.balloonNumber)"
                self.balloonImageView.image = balloon.balloonImage
                
            }, completion: {(finished: Bool) -> () in})
        
    }

    func create99Balloons ()
    {
        var zeroBalloon = Balloon(balloonNumber: 0, balloonImage: UIImage(named:"BerlinTVTower.jpg"))
        balloonArray.append(zeroBalloon)
        
        for var i = 1; i < 100; i++
        {
            let randomNumber = Int(arc4random_uniform(UInt32(4)))
            var randomImage = UIImage(named:"")
            
            switch randomNumber
                {
            case 0:
                randomImage = UIImage(named:"RedBalloon1.jpg")
            case 1:
                randomImage = UIImage(named:"RedBalloon2.jpg")
            case 2:
                randomImage = UIImage(named:"RedBalloon3.jpg")
            case 3:
                randomImage = UIImage(named:"RedBalloon4.jpg")
            default:
                break;
            }
            
            var balloon = Balloon(
                balloonNumber: i,
                balloonImage: randomImage
            )
            balloonArray.append(balloon)
        }
    }
}

