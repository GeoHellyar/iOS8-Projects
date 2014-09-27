//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by Brad Hellyar on 9/27/14.
//  Copyright (c) 2014 Hellyar. All rights reserved.
//

import Foundation

class LionCub:Lion {
    
    var isMale = false
    
    func rubLionCubBelly()
    {
        println("Lion Cub: Snuggle and Pur")
    }
    
    override func roar() {
        super.roar()
        println("Lion Cub: Growl Growl")
    }
    
    
    override func randomFact() -> String
    {
        var randomFact:String

        if isMale
        {
            randomFact = "Lion Cubs are usually hidden in dense bush for 6 weeks."
        }
        else
        {
            randomFact = "Cubs begin eating meat at abut the age of 6 weeks."
        }
        
        return randomFact
    }
}