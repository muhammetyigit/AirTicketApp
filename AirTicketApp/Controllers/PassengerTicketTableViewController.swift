//
//  PassengerTicketTableViewController.swift
//  AirTicketApp
//
//  Created by Muhammet Yiğit on 22.04.2025.
//

import UIKit

class PassengerTicketTableViewController: UITableViewController {
        
    // MARK: - Properties
    let passengerArray = PassengerManager.shared.passengers
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - TableView Delegate & DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passengerArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticket", for: indexPath) as! TicketTableViewCell
        let passenger = passengerArray[indexPath.row]
        cell.updateUI(passengerInfo: passenger.passengerInfo, flightInfo: passenger.fligtInfo, travellersInfo: passenger.travellersInfo, dateInfo: passenger.dateInfo)
        return cell
    }
}
