// Playground - noun: a place where people can play

import UIKit

var myTuple = ("Tigger", "Bengal", 3)

println("\(myTuple.0)")

var secondTuple = (name:"Tigress",breed: "Indochinese Tiger", age: 2)

println("\(secondTuple.name)")

switch secondTuple {
case ("Tigress","Indochinese Tiger", 2):
    println("First case is true")
    fallthrough
case (_,"Indochinese Tiger", _):
    println("Second case is true")
default:
    println("Default")
    
}
