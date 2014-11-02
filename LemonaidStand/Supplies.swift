//
//  Supplies.swift
//  LemonaidStand
//
//  Created by Brad Hellyar on 10/31/14.
//  Copyright (c) 2014 Hellyar. All rights reserved.
//

import Foundation


struct Supplies {
    var money = 0
    var lemons = 0
    var iceCubes = 0
    
    init (aMoney:Int, aLemon:Int, aIceCube:Int)
    {
        money = aMoney
        lemons = aLemon
        iceCubes = aIceCube
    }
}