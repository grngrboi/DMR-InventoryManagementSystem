import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // ==========================================
      // TOP APP BAR / HEADER
      // ==========================================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // Hide default back button
        title: Row(
          children: [
            const Icon(Icons.person_outline, color: Colors.black, size: 28),
            const SizedBox(width: 8),
            const Text(
              "Adam",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                // Logout Logic
                Navigator.pop(context);
              },
              child: const Row(
                children: [
                  Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.logout, color: Colors.black, size: 20),
                ],
              ),
            )
          ],
        ),
      ),
      
      // ==========================================
      // BODY CONTENT
      // ==========================================
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              children: [
                // 1. STATS CARDS
                Row(
                  children: [
                    _buildStatCard(
                      count: "21",
                      label: "In Progress",
                      icon: Icons.inventory_2_outlined,
                      color: const Color(0xFF64FFDA), // Cyan/Teal
                      textColor: Colors.black,
                    ),
                    const SizedBox(width: 16),
                    _buildStatCard(
                      count: "7",
                      label: "Completed",
                      icon: Icons.check_box_outlined,
                      color: const Color(0xFFB2FF59), // Light Green
                      textColor: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // 2. SEARCH BAR
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: "Search Motor",
                            prefixIcon: Icon(Icons.search, color: Colors.black),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.tune, color: Colors.black),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // 3. TABLE HEADER
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: Colors.grey[300], // Light grey background for header
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Expanded(
                  flex: 3,
                  child: Text(
                    "Progress",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Register Motor Logic
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.add_box_outlined, size: 18),
                      SizedBox(width: 4),
                      Text(
                        "Register Motor",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 4. MOTOR LIST (Placeholder Data)
          Expanded(
            child: ListView(
              children: const [
                MotorListItem(name: "GTF-2743", status: "Repairing", color: Colors.lightBlue),
                Divider(height: 1),
                MotorListItem(name: "HF23-12", status: "Completed", color: Colors.lightGreen),
                Divider(height: 1),
                MotorListItem(name: "RT830-90", status: "Not Assigned", color: Colors.yellow),
                Divider(height: 1),
                MotorListItem(name: "TOYO6Y7", status: "Sent to Third Party", color: Colors.purpleAccent),
                Divider(height: 1),
                MotorListItem(name: "CARD31", status: "Rejected", color: Colors.redAccent),
                Divider(height: 1),
                MotorListItem(name: "RDF9203", status: "Inspection", color: Colors.orangeAccent),
                Divider(height: 1),
              ],
            ),
          ),
        ],
      ),

      // ==========================================
      // BOTTOM NAVIGATION BAR
      // ==========================================
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        elevation: 4.0,
        shape: const CircleBorder(),
        child: Icon(Icons.home, color: Colors.indigo[700], size: 36),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        color: Colors.indigo[700], // Deep Blue Color
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Left Item
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.qr_code_scanner, color: Colors.white),
                  SizedBox(height: 4),
                  Text("Scan Code", style: TextStyle(color: Colors.white, fontSize: 12))
                ],
              ),
              // Spacer for the Floating Button
              const SizedBox(width: 40),
              // Right Item
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.grid_view, color: Colors.white),
                  SizedBox(height: 4),
                  Text("Others", style: TextStyle(color: Colors.white, fontSize: 12))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- HELPER WIDGET FOR STAT CARDS ---
  Widget _buildStatCard({
    required String count,
    required String label,
    required IconData icon,
    required Color color,
    required Color textColor,
  }) {
    return Expanded(
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Icon in a white circle
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            // Text Info
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  count,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: textColor.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// --- HELPER WIDGET FOR LIST ITEMS ---
class MotorListItem extends StatelessWidget {
  final String name;
  final String status;
  final Color color;

  const MotorListItem({
    super.key,
    required this.name,
    required this.status,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      color: Colors.white,
      child: Row(
        children: [
          // Motor Name
          Expanded(
            flex: 2,
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          // Status Indicator
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  status,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}