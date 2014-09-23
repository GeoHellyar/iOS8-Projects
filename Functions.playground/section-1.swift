// Playground - noun: a place where people can play

import UIKit

func printHelloWorld ()
{
    println("Hello World!")
    println("Hello Class!")
}

printHelloWorld()

func printNumberSupplied(number :Int)
{
    println("The number is: \(number)")
    println("\(number) * 3 = \(number * 3)")
    
}

printNumberSupplied(16)

func turnOffAppliance(applianceName: String,isOn: Bool)
{
    if isOn
    {
        println("Please turn off the \(applianceName)")
    }
    else
    {
        println("I actually turned the \(applianceName) off already")
    }
}

turnOffAppliance("Toaster", true)


func additionFunction (firstArg: Int, secondArg: Int) -> Int
{
    var sumOfArgs = firstArg + secondArg
    
    return sumOfArgs
}

var additionAnswerofInt = additionFunction(4, 4)
let finalANswer = additionFunction(additionAnswerofInt, 5)

func helloWorldString()->String
{
    printHelloWorld()
    
    return "Hello World"
}

var stringHelloWorld = helloWorldString() + "!"
