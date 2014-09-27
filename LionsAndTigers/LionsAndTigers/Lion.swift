//
//  Lion.swift
//  LionsAndTigers
//
//  Created by Brad Hellyar on 9/27/14.
//  Copyright (c) 2014 Hellyar. All rights reserved.
//

import Foundation
import UIKit

class Lion {
    var age = 0
    var isAlphaMale = false
    var image = UIImage(named: "")
    var name = ""
    var subSpecies = ""
    
    func roar ()
    {
        println("Lion: Roar...Roar")
    }
    
    func changeToAlphaMale ()
    {
        isAlphaMale = true
    }
    
    func randomFact() -> String
    {
        var randomFact:String
        
        if isAlphaMale == true
        {
            randomFact = "Male lions are easy to recognize thanks to their manes."
        }
        else
        {
            randomFact = "Female Lionesses form the stable social unit and do not tolerate outside females."
        }
        
        return randomFact
    }
    
}