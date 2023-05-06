//
//  PickerViewModel.swift
//  TransfersUI
//
//  Created by Bakai on 17/2/23.
//

import SwiftUI

class PickerState: ObservableObject {
    @Published var collectedDate: String = ""
    
    // Date Collector YY/MM/DD
    @Published var year: String = "" {
        didSet {
            self.collectedDate = "\(year) \(month) \(day)"
        }
    }
    @Published var month: String = "" {
        didSet {
            self.collectedDate = "\(year) \(month) \(day)"
        }
    }
    @Published var day: String = "" {
        didSet {
            self.collectedDate = "\(year) \(month) \(day)"
        }
    }
    
    @Published var frequncy: String = ""
    @Published var time: String = ""
    
    @Published var isPresented: Bool = false
    @Published var type: PickerType = .date
    
    var tuple: (type: PickerType, isPresented: Bool) = (type: .date, isPresented: false) {
        didSet {
            self.type = tuple.type
            self.isPresented =  tuple.isPresented
        }
    }
}

extension PickerState {
    static var frequencyData = ["Ежедневно",
                                "Еженедельно",
                                "Ежемесячно"]
    
    static var timeData = ["00:00",
                           "01:00",
                           "02:00",
                           "03:00",
                           "04:00",
                           "05:00",
                           "06:00"]
}
