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
    
    
    // Third Container
    var creditsLabel: UILabel!
    var betLabel: UILabel!
    var winnerPaidLabel: UILabel!
    
    var creditsTitleLabel: UILabel!
    var betTitleLabel: UILabel!
    var winnerPaidTitleLable: UILabel!
    
    // Fourth Container
    var resetButton: UIButton!
    var betOneButton: UIButton!
    var maxButton: UIButton!
    var spinButton: UIButton!
    
    // Constants
    let kMarginForView:CGFloat = 10.0
    let kMarginForButtons:CGFloat = 10.0
    let kSixth:CGFloat = 1.0/6.0
    let kThird:CGFloat = 1/3
    let kFourth:CGFloat = 1/4
    let kTenth:CGFloat = 1.0/10.0
    let kHalf: CGFloat = 1.0/2.0
    let kEighth: CGFloat = 1.0/8.0
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupContainerView()
        
        setupFirstContainer(firstContainer)
        setupSecondContainer(secondContainer)
        setupThirdContaianer(thirdContainer)
        setupFourthContainer(fourthContainer)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // IBActions
    
    func resetButtonPressed(button:UIButton)
    {
        println("Button Pressed")
    }
    
    func betOneButtonPressed(button:UIButton)
    {
        
    }
    
    func maxBetButtonPressed(button:UIButton)
    {
        
    }
    
    func spinButtonPressed(button:UIButton)
    {
        
    }

    func setupContainerView()
    {
        self.firstContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x,self.view.bounds.origin.y , self.view.bounds.width, self.view.bounds.height * kTenth))
        self.firstContainer.backgroundColor = slotsRedColor
        self.view.addSubview(self.firstContainer)
        
        self.secondContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, firstContainer.frame.height, self.view.bounds.width - kMarginForView * 2, self.view.bounds.height * (3 * kSixth)))
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.secondContainer)
        
        self.thirdContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x, firstContainer.frame.height + secondContainer.frame.height, self.view.bounds.width, self.view.bounds.height * kSixth))
        self.thirdContainer.backgroundColor = slotsGreenColor
        self.view.addSubview(self.thirdContainer)
        
        self.fourthContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x, firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height, self.view.bounds.width, self.view.bounds.height * (kSixth + kTenth)))
        self.fourthContainer.backgroundColor = slotsBlueColor
        self.view.addSubview(self.fourthContainer)
    }
    
    func setupFirstContainer(containerView: UIView )
    {
        titleLabel = UILabel()
        titleLabel.text = "Super Slots"
        titleLabel.textColor = slotsDarkRedColor
        titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 35)
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
    
    func setupThirdContaianer(containerView: UIView)
    {
        // Labels
        creditsLabel = UILabel(frame: CGRectMake(containerView.bounds.origin.x + kMarginForButtons * 2, containerView.frame.height * kFourth, containerView.frame.width * kThird - kMarginForButtons, containerView.frame.height * kThird))
        creditsLabel.text = "000000"
        creditsLabel.textColor = slotsGreenColor
        creditsLabel.font = UIFont(name: "Menlo-Bold", size: 26)
//        creditsLabel.sizeToFit()
//        creditsLabel.center = CGPointMake(containerView.frame.width * kSixth, containerView.frame.height * kThird + 10)
        creditsLabel.textAlignment = NSTextAlignment.Center
        creditsLabel.backgroundColor = slotsDarkGreenColor
        containerView.addSubview(creditsLabel)
        
        betLabel = UILabel(frame: CGRectMake(containerView.frame.width * kThird + kMarginForButtons * 2, containerView.frame.height * kFourth, containerView.frame.width * kThird - kMarginForButtons * 2, containerView.frame.height * kThird))
        betLabel.text = "0000"
        betLabel.textColor = slotsGreenColor
        betLabel.font = UIFont(name: "Menlo-Bold", size: 26)
//        betLabel.sizeToFit()
//        betLabel.center = CGPointMake(containerView.frame.width * kSixth * 3, containerView.frame.height * kThird + 10)
        betLabel.textAlignment = NSTextAlignment.Center
        betLabel.backgroundColor = slotsDarkGreenColor
        containerView.addSubview(betLabel)
        
        winnerPaidLabel = UILabel(frame: CGRectMake(containerView.frame.width * kThird * 2 + kMarginForButtons, containerView.frame.height * kFourth, containerView.frame.width * kThird - kMarginForButtons * 3, containerView.frame.height * kThird))
        winnerPaidLabel.text = "0000"
        winnerPaidLabel.textColor = slotsGreenColor
        winnerPaidLabel.font = UIFont(name: "Menlo-Bold", size: 26)
//        winnerPaidLabel.sizeToFit()
//        winnerPaidLabel.center = CGPointMake(containerView.frame.width * kSixth * 5, containerView.frame.height * kThird + 10)
        winnerPaidLabel.textAlignment = NSTextAlignment.Center
        winnerPaidLabel.backgroundColor = slotsDarkGreenColor
        containerView.addSubview(winnerPaidLabel)
        
        // Titles
        creditsTitleLabel = UILabel(frame: CGRectMake(containerView.bounds.origin.x + kMarginForButtons * 2, containerView.frame.height * kFourth * 2, containerView.frame.width * kThird - kMarginForButtons, containerView.frame.height * kThird))
        creditsTitleLabel.text = "Credits"
        creditsTitleLabel.textColor = slotsDarkGreenColor
        creditsTitleLabel.font = UIFont(name: "Menlo-Bold", size: 14)
//        creditsTitleLabel.sizeToFit()
//        creditsTitleLabel.center = CGPointMake(containerView.frame.width * kSixth, containerView.frame.height * kThird * 2)
        creditsTitleLabel.textAlignment = NSTextAlignment.Center
//        creditsTitleLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(creditsTitleLabel)
        
        betTitleLabel = UILabel(frame: CGRectMake(containerView.frame.width * kThird + kMarginForButtons * 2, containerView.frame.height * kFourth * 2, containerView.frame.width * kThird - kMarginForButtons * 2, containerView.frame.height * kThird))
        betTitleLabel.text = "Bet"
        betTitleLabel.textColor = slotsDarkGreenColor
        betTitleLabel.font = UIFont(name: "Menlo-Bold", size: 14)
//        betTitleLabel.sizeToFit()
//        betTitleLabel.center = CGPointMake(containerView.frame.width * kSixth * 3, containerView.frame.height * kThird * 2)
        betTitleLabel.textAlignment = NSTextAlignment.Center
//        betTitleLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(betTitleLabel)
        
        winnerPaidTitleLable = UILabel(frame: CGRectMake(containerView.frame.width * kThird * 2 + kMarginForButtons, containerView.frame.height * kFourth * 2, containerView.frame.width * kThird - kMarginForButtons * 3, containerView.frame.height * kThird))
        winnerPaidTitleLable.text = "Winner Paid"
        winnerPaidTitleLable.textColor = slotsDarkGreenColor
        winnerPaidTitleLable.font = UIFont(name: "Menlo-Bold", size: 14)
//        winnerPaidTitleLable.sizeToFit()
//        winnerPaidTitleLable.center = CGPointMake(containerView.frame.width * kSixth * 5, containerView.frame.height * kThird * 2)
        winnerPaidTitleLable.textAlignment = NSTextAlignment.Center
//        winnerPaidTitleLable.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(winnerPaidTitleLable)
        
    }
    
    func setupFourthContainer (containerView: UIView)
    {
        resetButton = UIButton(frame: CGRectMake(20 , containerView.frame.height * kThird * 1.75, containerView.frame.width * kThird - kMarginForButtons * 4, containerView.frame.height * kSixth))
        resetButton.setTitle("Reset", forState: UIControlState.Normal)
        resetButton.setTitleColor(slotsBlueColor, forState: UIControlState.Normal)
        resetButton.titleLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 18)
        resetButton.backgroundColor = slotsDarkBlueColor
//        resetButton.sizeToFit()
//        resetButton.center = CGPointMake(containerView.frame.width * kEighth, containerView.frame.height * kThird * 2)
        resetButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(resetButton)
        
        betOneButton = UIButton(frame: CGRectMake(containerView.frame.width * kThird, containerView.frame.height * kThird * 1.75, containerView.frame.width * kThird - kMarginForButtons * 2, containerView.frame.height * kSixth))
        betOneButton.setTitle("Bet One", forState: UIControlState.Normal)
        betOneButton.setTitleColor(slotsBlueColor, forState: UIControlState.Normal)
        betOneButton.titleLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 18)
        betOneButton.backgroundColor = slotsDarkBlueColor
//        betOneButton.sizeToFit()
//        betOneButton.center = CGPointMake(containerView.frame.width * kEighth * 3, containerView.frame.height * kThird * 2)
        betOneButton.addTarget(self, action: "betOneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(betOneButton)
        
        maxButton = UIButton(frame: CGRectMake(containerView.frame.width * kThird * 2, containerView.frame.height * kThird * 1.75, containerView.frame.width * kThird - kMarginForButtons * 2, containerView.frame.height * kSixth))
        maxButton.setTitle("Max Bet", forState: UIControlState.Normal)
        maxButton.setTitleColor(slotsBlueColor, forState: UIControlState.Normal)
        maxButton.titleLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 18)
        maxButton.backgroundColor = slotsDarkBlueColor
//        maxButton.sizeToFit()
//        maxButton.center = CGPointMake(containerView.frame.width * kEighth * 6, containerView.frame.height * kThird * 2)
        maxButton.addTarget(self, action: "maxBetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(maxButton)
        
        spinButton = UIButton(frame: CGRectMake( 20, 20, containerView.frame.width - 40, containerView.frame.height * kThird))
        spinButton.setTitle("Spin", forState: UIControlState.Normal)
        spinButton.setTitleColor(slotsBlueColor, forState: UIControlState.Normal)
        spinButton.titleLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 22)
        spinButton.backgroundColor = slotsDarkBlueColor
//        spinButton.center = CGPointMake(containerView.frame.width , containerView.frame.height * kThird)
        spinButton.addTarget(self, action: "spinButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(spinButton)
    }
}

