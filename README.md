# AirTicketApp
AirTicketApp is an iOS application that collects passenger flight information and displays it in a neatly organized table view.
It utilizes UIKit components such as UITableView, UIDatePicker, UIPickerView, and UIStepper. The app manages data using the Singleton design pattern for shared access.

## ✅ Features
- Input passenger details (name, surname, email)
- Choose departure and arrival cities via pickers
- Select flight date with `UIDatePicker`
- Add number of adults and children using steppers
- View selected flight data in a summarized ticket list
- Modern ticket-style cells using custom UI design
- Data management with Singleton pattern
- Local data handling with custom models and structures

## 🛠 App Highlights
📋 Form UI: Users fill in flight and passenger details with custom `UITableViewCell`  
📅 Flight Date: Custom formatted date from `UIDatePicker`  
🎫 Ticket UI: Stylish ticket-shaped cells for the flight list  
🧠 Singleton Pattern: `TicketManager` (or similar) for centralized data handling  
📁 Structured Architecture: Organized folders like `Controllers`, `Models`, `Views`  
🔄 Smooth UX: Dynamic row height and interactive pickers in the table view

## 📱 Technologies Used
- Swift  
- UIKit  
- UITableView  
- UIDatePicker  
- UIPickerView  
- UIStepper  
- Singleton Pattern  
- Custom Models & Structs  
- Auto Layout  

## Installation
To get started with the project, follow these steps:
- Clone the repository to your local machine:
  ```bash
  git clone https://github.com/muhammetyigit/AirTicketApp.git
  open AirTicketApp.xcodeproj

## 📸 Screenshots
<p align="center">
  <img src="https://github.com/muhammetyigit/AirTicketApp/blob/main/gif1.gif?raw=true" alt="AirTicketApp GIF 1" width="500"/>
  <br><br>
  <img src="https://github.com/muhammetyigit/AirTicketApp/blob/main/gif2.gif?raw=true" alt="AirTicketApp GIF 2" width="500"/>
    <br><br>
  <img src="https://github.com/muhammetyigit/AirTicketApp/blob/main/ss1.png?raw=true" alt="AirTicketApp Screenshot 1" width="500"/>
    <br><br>
  <img src="https://github.com/muhammetyigit/AirTicketApp/blob/main/ss2.png?raw=true" alt="AirTicketApp Screenshot 2" width="500"/>
   <br><br>
  <img src="https://github.com/muhammetyigit/AirTicketApp/blob/main/ss3.png?raw=true" alt="AirTicketApp Screenshot 3" width="500"/>
</p>

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
