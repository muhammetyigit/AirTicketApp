//
//  TicketTableViewCell.swift
//  AirTicketApp
//
//  Created by Muhammet Yiğit on 22.04.2025.
//

import UIKit

class TicketTableViewCell: UITableViewCell {
    
    // MARK: - UI Labels
    @IBOutlet weak var passengerInfoLabel: UILabel!
    @IBOutlet weak var flightInfoLabel: UILabel!
    @IBOutlet weak var travellersInfoLabel: UILabel!
    @IBOutlet weak var dateInfoLabel: UILabel!
    
    
    // MARK: - Functions
    func updateUI(passengerInfo: String, flightInfo: String, travellersInfo: String, dateInfo: String) {
        passengerInfoLabel.text = passengerInfo
        flightInfoLabel.text = flightInfo
        travellersInfoLabel.text = travellersInfo
        dateInfoLabel.text = dateInfo
    }
    
}
