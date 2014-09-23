//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Brad Hellyar on 9/21/14.
//  Copyright (c) 2014 Hellyar. All rights reserved.
//

import Foundation
import UIKit

//Tiger Struct
struct Tiger
{
    var age = 0
    var name:String
    var breed:String
    var image = UIImage(named:"")
    
    func chuff ()
    {
        println("Tiger: Chuff, Chuff")
    }
    
    func chuffANumberOfTimes (numberOfTimes:Int)
    {
        for var chuff = 0; chuff < numberOfTimes; chuff++
        {
            self.chuff()
        }
    }
    
    func chuffANumberOfTImes (numberOfTimes:Int, isLoud:Bool)
    {
        for var chuffTimes = 1; chuffTimes < numberOfTimes; chuffTimes++
        {
            if isLoud
            {
                chuff()
            }
            else
            {
                println("Tiger: purr purr")
            }
        }
    }
    
    func ageInTigerYearsFromAge(regularAge:Int) -> Int
    {
        let newAge = regularAge * 3
        return newAge
    }
    
    func randomFact() -> String
    {
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        var randomFact:String
        
        switch randomNumber
        {
        case 0:
            randomFact = "The tiger is the biggest species in the family"
        case 1:
            randomFact = "Tigers can reach a length of 3.3 meters"
        case 2:
            randomFact = "A group of tigers is known as an 'ambush' or 'streak'"
        default:
            randomFact = "nil"
        }

        return randomFact
    }
}
