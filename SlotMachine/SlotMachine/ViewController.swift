//
//  ViewController.swift
//  SlotMachine
//
//  Created by Brad Hellyar on 9/27/14.
//  Copyright (c) 2014 Hellyar. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    // Containers
    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    
    // First Container
    var titleLabel:UILabel!
    
    // Second Container
    let kNumberOfContainers = 3
    let kNumberOfSlots = 3
    let kMaringForSlot:CGFloat = 2.0
    let kThird:CGFloat = 1/3
    
    // Third Container
    var creditsLabel: UILabel!
    var betLabel: UILabel!
    var winnerPaidLabel: UILabel!
    
    var creditsTitleLabel: UILabel!
    var betTitleLabel: UILabel!
    var winnerPaidTitleLable: UILabel!
    
    // Constants
    let kMarginForView:CGFloat = 10.0
    let kSixth:CGFloat = 1.0/6.0
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupContainerView()
        
        setupFirstContainer(firstContainer)
        setupSecondContainer(secondContainer)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupContainerView()
    {
        self.firstContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x,self.view.bounds.origin.y , self.view.bounds.width, self.view.bounds.height * kSixth))
        self.firstContainer.backgroundColor = UIColor(red: 210/255, green: 70/255, blue: 52/255, alpha: 1.0)
        self.view.addSubview(self.firstContainer)
        
        self.secondContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, firstContainer.frame.height, self.view.bounds.width - kMarginForView * 2, self.view.bounds.height * (3 * kSixth)))
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.secondContainer)
        
        self.thirdContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x, firstContainer.frame.height + secondContainer.frame.height, self.view.bounds.width, self.view.bounds.height * kSixth))
        self.thirdContainer.backgroundColor = UIColor(red: 110/255, green: 164/255, blue: 46/255, alpha: 1.0)
        self.view.addSubview(self.thirdContainer)
        
        self.fourthContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x, firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height, self.view.bounds.width, self.view.bounds.height * kSixth))
        self.fourthContainer.backgroundColor = UIColor(red: 46/255, green: 99/255, blue: 164/255, alpha: 1.0)
        self.view.addSubview(self.fourthContainer)
    }
    func setupFirstContainer(containerView: UIView )
    {
        titleLabel = UILabel()
        titleLabel.text = "Super Slots"
        titleLabel.textColor = UIColor(red: 227/255, green: 234/255, blue: 112/255, alpha: 1.0)
        titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        titleLabel.sizeToFit()
        titleLabel.center = containerView.center
        
        containerView.addSubview(titleLabel)
    }
    
    func setupSecondContainer(containerView: UIView)
    {
        for var containerNumber = 0; containerNumber < kNumberOfContainers; containerNumber++
        {
            for var slotNumber = 0; slotNumber < kNumberOfSlots; slotNumber++
            {
                var slotImageView = UIImageView()
                slotImageView.backgroundColor = UIColor.yellowColor()
                slotImageView.frame = CGRectMake(containerView.bounds.origin.x + containerView.bounds.size.width * CGFloat(containerNumber) * kThird,
                    containerView.bounds.origin.y + containerView.bounds.size.height * CGFloat(slotNumber) * kThird,
                    containerView.bounds.width * kThird - kMaringForSlot,
                    containerView.bounds.height * kThird - kMaringForSlot)
                containerView.addSubview(slotImageView)
            }
        }
        
    }
    
    func setupThirdContaianer(conatinerView: UIView)
    {
        
    }
}

