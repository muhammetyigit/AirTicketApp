//
//  Passenger.swift
//  AirTicketApp
//
//  Created by Muhammet Yiğit on 22.04.2025.
//

import Foundation

struct Passenger {
    
    // MARK: - Properties
    var firstName: String
    var lastName: String
    var email: String
    
    var fromCity: String
    var toCity: String
    
    var date: Date
    
    var adults: Int
    var children: Int
    
    var passengerInfo: String {
        return "\(firstName) \(lastName)"
    }
    
    var fligtInfo: String {
        return "\(fromCity) → \(toCity)"
    }
    
    var dateInfo: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        let formattedDate = formatter.string(from: date)
        
        return formattedDate
    }
    
    var travellersInfo: String {
        return "Adults: \(adults) Children: \(children)"
    }
}
