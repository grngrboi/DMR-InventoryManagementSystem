import 'package:flutter/material.dart';
import '../widgets/shared_widgets.dart'; // Reuse your shared input widgets

class MotorDetailsScreen extends StatefulWidget {
  const MotorDetailsScreen({super.key});

  @override
  State<MotorDetailsScreen> createState() => _MotorDetailsScreenState();
}

class _MotorDetailsScreenState extends State<MotorDetailsScreen> {
  // Controllers for the form
  final _nameController = TextEditingController();
  final _typeController = TextEditingController();
  final _brandController = TextEditingController();
  final _ssidController = TextEditingController();
  final _dateRegController = TextEditingController();
  final _userRegController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Motor Details", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
            Text("General Motor Details", style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Image Upload Placeholder
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[300],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.image_outlined, size: 50, color: Colors.black54),
                  SizedBox(height: 10),
                  Text("Upload Picture of Motor", style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),

            // 2. Form Fields
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  buildLabel("Generator Name *"), const SizedBox(height: 8),
                  buildTextField(controller: _nameController, hint: ""),
                  const SizedBox(height: 16),

                  buildLabel("Generator Type *"), const SizedBox(height: 8),
                  buildTextField(controller: _typeController, hint: ""),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            buildLabel("Generator Brand *"), const SizedBox(height: 8),
                            buildTextField(controller: _brandController, hint: ""),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          children: [
                            buildLabel("Generator SSID"), const SizedBox(height: 8),
                            buildTextField(controller: _ssidController, hint: ""),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            buildLabel("Date Registered *"), const SizedBox(height: 8),
                            buildTextField(controller: _dateRegController, hint: ""),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          children: [
                            buildLabel("User Registered *"), const SizedBox(height: 8),
                            buildTextField(controller: _userRegController, hint: ""),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  // 3. Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            foregroundColor: Colors.black,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text("Cancel", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Pass data to next screen (Issues)
                            Navigator.pushNamed(
                              context, 
                              '/motor_issues', 
                              arguments: {'motorName': _nameController.text, 'motorType': _typeController.text}
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFB2FF59), // Light Green
                            foregroundColor: Colors.black,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text("Proceed", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Shared Navigation
      floatingActionButton: buildHomeFab(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomNavBar(context, currentRoute: ''),
    );
  }
}