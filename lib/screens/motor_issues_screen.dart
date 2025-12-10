import 'package:flutter/material.dart';
import '../widgets/shared_widgets.dart';

class MotorIssuesScreen extends StatefulWidget {
  const MotorIssuesScreen({super.key});

  @override
  State<MotorIssuesScreen> createState() => _MotorIssuesScreenState();
}

class _MotorIssuesScreenState extends State<MotorIssuesScreen> {
  // Store issues locally
  List<Map<String, String>> issues = [];

  // Function to add issue (called from dialog)
  void _addIssue(String issue, String fix, String notes) {
    setState(() {
      issues.add({'issue': issue, 'fix': fix, 'notes': notes});
    });
  }

  // Function to show the "Add Issue" Dialog
  void _showAddIssueDialog() {
    showDialog(
      context: context,
      builder: (context) => AddIssueDialog(onAdd: _addIssue),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments passed from previous screen
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final motorName = args?['motorName'] ?? "Unknown Motor";
    final motorType = args?['motorType'] ?? "Unknown Type";

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
            Text("Motor Issues", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
            Text("List Generator Issues", style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Same Image Placeholder (Visual Consistency)
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[300],
              child: const Center(
                child: Icon(Icons.image_outlined, size: 50, color: Colors.black54),
              ),
            ),

            // 2. Motor Info Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Generator Name", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  Text(motorName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              ),
            ),

            // 3. Current Issues Header & Button
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Current Issues", style: TextStyle(fontWeight: FontWeight.bold)),
                  InkWell(
                    onTap: _showAddIssueDialog,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.add, size: 16),
                          SizedBox(width: 4),
                          Text("Add Issues", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 4. List of Issues
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: issues.length,
              separatorBuilder: (ctx, index) => const Divider(height: 1),
              itemBuilder: (ctx, index) {
                return Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(issues[index]['issue']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                            Text(motorType, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            issues.removeAt(index);
                          });
                        },
                        icon: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(color: Colors.redAccent.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                          child: const Icon(Icons.delete_outline, color: Colors.red, size: 20),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 40),

            // 5. Final Action Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text("Back", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Complete Registration -> Return to Dashboard
                        // We use pushNamedAndRemoveUntil to clear the stack back to Dashboard
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Motor Registered Successfully!')));
                        Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB2FF59), // Light Green
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text("Register Motor", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButton: buildHomeFab(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomNavBar(context, currentRoute: ''),
    );
  }
}

// ==========================================
// DIALOG WIDGET (Add Motor Issues)
// ==========================================
class AddIssueDialog extends StatefulWidget {
  final Function(String, String, String) onAdd;
  const AddIssueDialog({super.key, required this.onAdd});

  @override
  State<AddIssueDialog> createState() => _AddIssueDialogState();
}

class _AddIssueDialogState extends State<AddIssueDialog> {
  final _issueController = TextEditingController();
  final _fixController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Wrap content height
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Add Motor Issues", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    Text("Describe Generator Issues", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
              ],
            ),
            const SizedBox(height: 20),
            
            buildLabel("Issue *"),
            const SizedBox(height: 8),
            buildTextField(controller: _issueController, hint: ""),
            
            const SizedBox(height: 16),
            buildLabel("Suggested Fix"),
            const SizedBox(height: 8),
            buildTextField(controller: _fixController, hint: ""),

            const SizedBox(height: 16),
            buildLabel("Additional Notes"),
            const SizedBox(height: 8),
            Container(
              height: 100, // Taller box for notes
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _notesController,
                maxLines: null,
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),

            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_issueController.text.isNotEmpty) {
                    widget.onAdd(_issueController.text, _fixController.text, _notesController.text);
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFB74D), // Orange Accent
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("Add Issues", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}