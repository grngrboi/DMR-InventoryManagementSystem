# DMR Motor Inventory Management System 🏭

**Version:** 1.0  
**Group:** Quantum Savants

### 📂 Project Structure
```text
lib/
├── main.dart
├── screens/
│   ├── dashboard_screen.dart
│   ├── login_screen.dart
│   └── registration_screen.dart
└── widgets/
    └── shared_widgets.dart
    
## 📋 About The Project
The **Sub-Warehouse Motor Inventory Management System** is a centralized mobile application designed for **Daiken Miri Sdn. Bhd. (DMR)**. 

Currently, DMR uses scattered Excel sheets for motor tracking, leading to data fragmentation and inefficiencies[cite: 43, 44]. ]This project digitalizes these operations, providing a native Android application that facilitates real-time tracking, secure data storage, and visual warehouse management[cite: 45, 46].

## ✨ Key Features
This system is designed with two distinct user roles: **Administrators** and **Technicians**[cite: 103, 108].

### 🛠 Technician Module
**Real-time Status Updates:** Change motor status (e.g., In-Use, In-Repair, Damaged) instantly[cite: 182].
**Visual Warehouse Map:** Locate motors using a digital map of racks, levels, and sections[cite: 176].
**Search:** Quickly find motors by ID, Tag, or Technical Specifications (HP, RPM, Voltage)[cite: 174].
**Service History:** View complete repair and maintenance logs[cite: 185].

### 🛡️ Administrator Module
**User Management:** Create accounts and assign roles (RBAC)[cite: 172].
**Inventory Control:** Perform CRUD operations on motor records[cite: 179].
**Layout Configuration:** Dynamically modify the warehouse structure (racks/partitions)[cite: 176].

## 📱 Tech Stack
**Frontend:** Flutter (Dart) [cite: 101]
**Backend:** Google Firebase (Authentication & Firestore) [cite: 101, 148]
**Platform:** Native Android [cite: 100]
**Hardware Features:** Camera integration for OCR/Condition Capture [cite: 147]

## 🚀 Getting Started

### Prerequisites
* **Android Studio** with Flutter SDK installed.
**Android Device/Emulator** (Min RAM: 3GB, Android 10.0+)[cite: 123, 153].
Active Internet connection (Wi-Fi/Cellular) for Firebase sync[cite: 119].

### Installation
1.  Clone the repository:
    ```bash
    git clone [https://github.com/your-username/dmr-inventory-system.git](https://github.com/your-username/dmr-inventory-system.git)
    ```
2.  Navigate to the project directory:
    ```bash
    cd dmr-inventory-system
    ```
3.  Install dependencies:
    ```bash
    flutter pub get
    ```
4.  Run the app:
    ```bash
    flutter run
    ```

> **Note:** This project requires a valid `google-services.json` file to connect to the Firebase backend. 

## 👥 The Team (Quantum Savants)
* **Jeremy Tommy Ajeng Emang** (99286)
* **Dexter Skudd anak John Rizal** (101630)
* **Muhammad Faiq bin Suhadi** (82723)
* **Eamonn Nathanael Jong Kwok** (83691)
* **Victor Aezekiel Isaac Zeno** (86251)
* **Naomi Ruran Odau** (97620)

---
