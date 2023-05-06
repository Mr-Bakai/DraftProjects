//
//  BuriedSwitch.swift
//  TransfersUI
//
//  Created by Bakai on 18/2/23.
//

import SwiftUI

protocol Employee {
    func isPayday() -> Bool
    func calculatePay() -> Money
    func deliverPay(_ pay: Money)
}


protocol EmployeeFactory {
    func makeEmployee(_ r: EmployeeRecord) throws -> Employee
}

class EmployeeFactoryImpl: EmployeeFactory {
    func makeEmployee(_ r: EmployeeRecord) throws -> Employee {
        switch r.type {
        case .commissioned:
            return CommissionedEmployee(r)
        case .hourly:
            return HourlyEmployee(r)
        case .salaried:
            return SalariedEmployee(r)
        default:
//            throw InvalidEmployeeType(r.type)
            break
        }
    }
}

// EmployeeRecord struct
struct EmployeeRecord {
    var type: EmployeeType
    // Add other properties as needed
}

// EmployeeType enum
enum EmployeeType {
    case commissioned
    case hourly
    case salaried
}

// Money class/struct
class Money {
    
}


class CommissionedEmployee: Employee {
    var r: EmployeeRecord
    
    init(_ r: EmployeeRecord) {
        self.r = r
    }
    
    
    func isPayday() -> Bool {
        return false
    }
    
    func calculatePay() -> Money {
        return Money()
    }
    
    func deliverPay(_ pay: Money) {
        
    }
}


class HourlyEmployee: Employee {
    var r: EmployeeRecord
    
    init(_ r: EmployeeRecord) {
        self.r = r
    }
    
    func isPayday() -> Bool {
        return false
    }
    
    func calculatePay() -> Money {
        return Money()
    }
    
    func deliverPay(_ pay: Money) {
        
    }
}

class SalariedEmployee: Employee {
    var r: EmployeeRecord
    
    init(_ r: EmployeeRecord) {
        self.r = r
    }
    
    func isPayday() -> Bool {
        return false
    }
    
    func calculatePay() -> Money {
        return Money()
    }
    
    func deliverPay(_ pay: Money) {
        
    }
}

enum InvalidEmployeeType: Error {
    case invalidType(String)
}
