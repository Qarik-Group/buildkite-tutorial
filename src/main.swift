#!/usr/bin/swift 

import Foundation 
class MythicalBeast { 
    func whatsMyName() { 
        print("I don't know what I am, but I'm the stuff of legends.") 
    } 
} 

class Kraken: MythicalBeast { 
    override func whatsMyName() { 
        print("I'm the Kraken, yo!") 
        fputs("[SCUI fputs] This is working with fputs", stdout)
    } 
} 

//can't use the Kraken class until after the declaration 
let kraken = Kraken()
kraken.whatsMyName()
