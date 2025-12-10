import 'package:flutter/material.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      // ==========================================
      // APP BAR (Flash Icon Only)
      // ==========================================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context), // Returns to Dashboard
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.flash_on_outlined, color: Colors.black),
            onPressed: () {
              // TODO: Toggle Flashlight
            },
          ),
        ],
      ),

      // ==========================================
      // BODY (Camera Placeholder & Text)
      // ==========================================
      body: Column(
        children: [
          const SizedBox(height: 20),
          
          // 1. Camera Placeholder
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.grey[300], // Placeholder for Camera View
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(Icons.camera_alt_outlined, size: 50, color: Colors.grey),
              ),
            ),
          ),
          
          const SizedBox(height: 30),

          // 2. Text Instructions
          const Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  "Scan Motor Barcode",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Scan Barcode to update the\nprogress of the motor",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // ==========================================
      // BOTTOM NAVIGATION (Consistent with Dashboard)
      // ==========================================
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Tapping Home returns to Dashboard
        },
        backgroundColor: const Color(0xFF3F51B5), // Deep Blue (Indigo)
        elevation: 4.0,
        shape: const CircleBorder(),
        child: const Icon(Icons.home, color: Colors.white, size: 36),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        color: const Color(0xFF3F51B5), // Deep Blue (Indigo)
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Left Item (Scan Code - Active State Visuals)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.qr_code_scanner, color: Colors.white), // Highlighted?
                  SizedBox(height: 4),
                  Text("Scan Code", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))
                ],
              ),
              // Spacer for the Floating Button
              const SizedBox(width: 40),
              // Right Item
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.grid_view, color: Colors.white.withOpacity(0.7)),
                  const SizedBox(height: 4),
                  Text("Others", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}