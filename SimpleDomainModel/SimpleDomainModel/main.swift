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
    
    public func convert(_ to: String) -> Money {
        let startingCurrency : String = self.currency
        var amountCopy : Int = self.amount
        
        if (startingCurrency != to) {
            if (startingCurrency != "USD") {
                if (startingCurrency == "GBP") {
                    amountCopy = amountCopy * 2
                } else if (startingCurrency == "EUR") {
                    amountCopy = amountCopy * 2 / 3
                } else {
                    amountCopy = amountCopy * 4 / 5
                }
            }
            
            if (to != "USD") {
                if (to == "GBP") {
                    amountCopy = amountCopy / 2
                } else if (to == "EUR") {
                    amountCopy = amountCopy * 3 / 2
                } else {
                    amountCopy = amountCopy * 5 / 4
                }
            }
        }
        /*self.amount = amountCopy
        self.currency = to*/
        return Money(amount: amountCopy, currency: to)
    }
    
    public func add(_ to: Money) -> Money {
        var selfMoney = Money(amount: self.amount, currency: self.currency)
        if (to.currency != self.currency) {
            selfMoney = self.convert(to.currency)
        }
        selfMoney.amount += to.amount
        return Money(amount: selfMoney.amount, currency: selfMoney.currency)
    }
    
    public func subtract(_ from: Money) -> Money {
        var selfMoney = Money(amount: self.amount, currency: self.currency)
        if (from.currency != self.currency) {
            selfMoney = self.convert(from.currency)
        }
        selfMoney.amount -= from.amount
        return Money(amount: selfMoney.amount, currency: selfMoney.currency)
    }
}

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
        self.title = title
        self.type = type
    }
    
    open func calculateIncome(_ hours: Int) -> Int {
        switch self.type {
        case .Hourly(let hourly):
            return Int(hourly * Double(hours))
        case .Salary(let annual):
            return annual
        }
    }
    
    open func raise(_ amt : Double) {
        switch self.type {
        case .Hourly(let hourly):
            self.type = JobType.Hourly(hourly + amt)
        case .Salary(let annual):
            self.type = JobType.Salary(annual + Int(amt))
        }
    }
}
/*
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




