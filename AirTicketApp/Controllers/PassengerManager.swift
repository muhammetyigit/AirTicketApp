//
//  PassengerManager.swift
//  AirTicketApp
//
//  Created by Muhammet Yiğit on 22.04.2025.
//

import Foundation

class PassengerManager {
    
    // MARK: - Properties
    static let shared = PassengerManager()
    var passengers: [Passenger] = []
    
    // MARK: - Functions
    private init() {}
}
