//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
    return "I have been tested"
}

open class TestMe {
    open func Please() -> String {
        return "I have been tested"
    }
}

////////////////////////////////////
// Money
//
public struct Money {
    public var amount : Int
    public var currency : String
    
    public mutating func convert(_ to: String) -> Money {
        let startingCurrency : String = self.currency
        var amountCopy : Int = self.amount
        
        if (startingCurrency != to) {
            if (startingCurrency != "USD") {
                if (startingCurrency == "GBP") {
                    amountCopy = amountCopy * 2
                } else if (startingCurrency == "EUR") {
                    amountCopy = amountCopy / 3 * 2
                } else {
                    amountCopy = amountCopy / 5 * 4
                }
            }
            
            if (to == "GBP") {
                amountCopy = amountCopy / 2
            } else if (startingCurrency == "EUR") {
                amountCopy = amountCopy * 3 / 2
            } else {
                amountCopy = amountCopy * 5 / 4
            }
        }
        self.amount = amountCopy
        self.currency = to
        return Money(amount: amountCopy, currency: to)
    }
    
    public mutating func add(_ to: Money) -> Money {
        if (to.currency != self.currency) {
            self = convert(to.currency)
        }
        self.amount += to.amount
        return Money(amount: self.amount, currency: self.currency)
    }
    
    public mutating func subtract(_ from: Money) -> Money {
        if (from.currency != self.currency) {
            self = convert(from.currency)
        }
        self.amount -= from.amount
        return Money(amount: self.amount, currency: self.currency)
    }
}
/*
////////////////////////////////////
// Job
//
open class Job {
    fileprivate var title : String
    fileprivate var type : JobType
    
    public enum JobType {
        case Hourly(Double)
        case Salary(Int)
    }
    
    public init(title : String, type : JobType) {
    }
    
    open func calculateIncome(_ hours: Int) -> Int {
    }
    
    open func raise(_ amt : Double) {
    }
}

////////////////////////////////////
// Person
//
open class Person {
    open var firstName : String = ""
    open var lastName : String = ""
    open var age : Int = 0
    
    fileprivate var _job : Job? = nil
    open var job : Job? {
        get { }
        set(value) {
        }
    }
    
    fileprivate var _spouse : Person? = nil
    open var spouse : Person? {
        get { }
        set(value) {
        }
    }
    
    public init(firstName : String, lastName: String, age : Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    open func toString() -> String {
    }
}

////////////////////////////////////
// Family
//
open class Family {
    fileprivate var members : [Person] = []
    
    public init(spouse1: Person, spouse2: Person) {
    }
    
    open func haveChild(_ child: Person) -> Bool {
    }
    
    open func householdIncome() -> Int {
    }
}
*/




