import 'package:flutter/material.dart';

class UserSettingsScreen extends StatelessWidget {
  const UserSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context), // Returns to Dashboard
        ),
        title: const Text(
          "User Profile",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          children: [
            // ==========================================
            // PROFILE ICON SECTION (Stacked Icon + Gear)
            // ==========================================
            SizedBox(
              height: 120,
              width: 120,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.person_outline,
                      size: 100,
                      color: Colors.black,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, right: 10),
                      child: Icon(
                        Icons.settings,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 40),

            // ==========================================
            // MENU BUTTONS LIST
            // ==========================================
            _buildMenuButton(context, "Account Settings"),
            const SizedBox(height: 15),
            _buildMenuButton(context, "Password"),
            const SizedBox(height: 15),
            _buildMenuButton(context, "Notifications"),
            const SizedBox(height: 15),
            _buildMenuButton(context, "Languages"),
            const SizedBox(height: 15),
            _buildMenuButton(context, "Authentication"),
            const SizedBox(height: 15),
            _buildMenuButton(context, "About"),
          ],
        ),
      ),
    );
  }

  // Helper widget to create the grey buttons consistently
  Widget _buildMenuButton(BuildContext context, String label) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          // Placeholder for future functionality
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[300], // Match the grey in image
          foregroundColor: Colors.black,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}