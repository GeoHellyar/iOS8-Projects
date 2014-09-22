// Playground - noun: a place where people can play

import UIKit

var tigerNames = ["Tigger", "Tigress"]

tigerNames.append("Jacob")

println("\(tigerNames)")

tigerNames += ["John","Elliot"]

tigerNames[0] = "Spar"

println("\(tigerNames)")

tigerNames[0...1] = ["Kate","Panda"]

println("\(tigerNames)")

tigerNames.insert("Julie", atIndex: 1)

println("\(tigerNames)")

tigerNames.removeAtIndex(1)
println("\(tigerNames)")

tigerNames.removeAll(keepCapacity: false)
println("\(tigerNames)")