//
//  DailyScrum.swift
//  TransfersUI
//
//  Created by Bakai on 31/1/23.
//

import SwiftUI

struct DailyScrum: Identifiable, Codable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
    }
}

extension DailyScrum {
    struct Attendee: Identifiable, Codable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    struct Data {
        var title: String = ""
        var attendees: [Attendee] = []
        var lengthInMinutes: Double = 5
    }
    
    var data: Data {
        Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes))
    }
    
    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
    }
    
    init(data: Data) {
        id = UUID()
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Между счетами", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10 ),
        DailyScrum(title: "Из другого банка", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5),
        DailyScrum(title: "Обмен валют", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5),
        DailyScrum(title: "По номеру карты/счета", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5),
        DailyScrum(title: "Моментальный VISA2VISA", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5),
        DailyScrum(title: "Межбанковский в сомах", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5),
        DailyScrum(title: "Межбанковский в валюте", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5),
        DailyScrum(title: "Элкарт на Элкарт", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5),
        DailyScrum(title: "По номеру телефона", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5),
        DailyScrum(title: "Между счетами", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10 ),
        DailyScrum(title: "Из другого банка", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5),
        DailyScrum(title: "Обмен валют", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5),
        DailyScrum(title: "По номеру карты/счета", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5),
        DailyScrum(title: "Моментальный VISA2VISA", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5),
        DailyScrum(title: "Межбанковский в сомах", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5),
        DailyScrum(title: "Межбанковский в валюте", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5),
        DailyScrum(title: "Элкарт на Элкарт", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5),
        DailyScrum(title: "По номеру телефона", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5)
    ]
}
