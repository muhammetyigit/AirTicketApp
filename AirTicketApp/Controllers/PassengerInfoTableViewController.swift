//
//  PassengerInfoTableViewController.swift
//  AirTicketApp
//
//  Created by Muhammet Yiğit on 21.04.2025.
//

import UIKit

class PassengerInfoTableViewController: UITableViewController {
    
    // MARK: - UI Elements
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var departurePicker: UIPickerView!
    @IBOutlet weak var arrivalPicker: UIPickerView!
    
    @IBOutlet weak var departureLabel: UILabel!
    @IBOutlet weak var arrivalLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var numberAdultsLabel: UILabel!
    @IBOutlet weak var numberAdultsStepper: UIStepper!
    
    @IBOutlet weak var numberChildrenLabel: UILabel!
    @IBOutlet weak var numberChildrenStepper: UIStepper!
    
    // MARK: - Properties
    let cities = ["İstanbul", "Ankara", "İzmir", "Antalya", "Bursa", "İzmir", "Antalya", "Trabzon", "Rize", "Erzurum", "Düzce", "Balıkesir"]
    var selectedDepartureCity = ""
    var selectedArrivalCity = ""
    
    let departureLabelIndexPath = IndexPath(row: 0, section: 1)
    let departurePickerIndexPath = IndexPath(row: 1, section: 1)
    
    let arrivalLabelIndexPath = IndexPath(row: 0, section: 2)
    let arrivalPickerIndexPath = IndexPath(row: 1, section: 2)
    
    let datePickerLabelIndexPath = IndexPath(row: 0, section: 3)
    let datePickeIndexPath = IndexPath(row: 1, section: 3)
    
    
    
    var isDepaturePicker: Bool = false {
        didSet {
            departurePicker.isHidden = !isDepaturePicker
        }
    }
    
    var isArrivalPicker: Bool = false {
        didSet {
            arrivalPicker.isHidden = !isArrivalPicker
        }
    }
    
    var isDatePicker: Bool = false {
        didSet {
            datePicker.isHidden = !isDatePicker
        }
    }
    
    var passenger: Passenger?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        departurePicker.delegate = self
        departurePicker.dataSource = self
        
        arrivalPicker.delegate = self
        arrivalPicker.dataSource = self
        
        datePicker.contentHorizontalAlignment = .center
        datePicker.minimumDate = Date()
        
    }
    
    // MARK: - Functions
    func dateFormat(with date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
    
    // MARK: - Actions
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        let firstName = firstNameTextField.text!
        let lastName = lastNameTextField.text!
        let email = emailTextField.text!
        let depature = departureLabel.text!
        let arrival = arrivalLabel.text!
        let date = datePicker.date
        let adults = Int(numberAdultsStepper.value)
        let children = Int(numberChildrenStepper.value)
        
        passenger = Passenger(firstName: firstName, lastName: lastName, email: email, fromCity: depature, toCity: arrival, date: date, adults: adults, children: children)
        PassengerManager.shared.passengers.append(passenger!)
        
        performSegue(withIdentifier: "ticket", sender: self)
    }
    
    @IBAction func datePickerTapped(_ sender: UIDatePicker) {
        let date = sender.date
        let formatedDate = dateFormat(with: date)
        dateLabel.text = formatedDate
    }
    
    @IBAction func stepperValuChanged(_ sender: UIStepper) {
        numberAdultsLabel.text   =  "\(Int(numberAdultsStepper.value))"
        numberChildrenLabel.text =  "\(Int(numberChildrenStepper.value))"
    }
}

// MARK: - TableView Delegate & DataSource
extension PassengerInfoTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath {
        case departurePickerIndexPath:
            if isDepaturePicker {
                return 120
            } else {
                return 0
            }
            
        case arrivalPickerIndexPath:
            if isArrivalPicker {
                return 120
            } else {
                return 0
            }
            
        case arrivalPickerIndexPath:
            if isArrivalPicker {
                return 120
            } else {
                return 0
            }
            
        case datePickeIndexPath:
            if isDatePicker {
                return 80
            } else {
                return 0
            }
            
        default:
            return 60
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath {
        case departureLabelIndexPath:
            isDepaturePicker = !isDepaturePicker
            isArrivalPicker = false
            isDatePicker = false
            
        case arrivalLabelIndexPath:
            isArrivalPicker = !isArrivalPicker
            isDepaturePicker = false
            isDatePicker = false
            
        case datePickerLabelIndexPath:
            isDatePicker = !isDatePicker
            isDepaturePicker = false
            isArrivalPicker = false
            
        default:
            break
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
    }
}


// MARK: - UIPickerView Delegate & DataSource
extension PassengerInfoTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCity = cities[row]
        
        if isDepaturePicker {
            selectedDepartureCity = selectedCity
            departureLabel.text = selectedCity
        }
        
        if isArrivalPicker {
            selectedArrivalCity = selectedCity
            arrivalLabel.text = selectedCity
        }
    }
}
