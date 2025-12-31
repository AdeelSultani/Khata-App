import 'package:flutter/material.dart';
import 'package:khata_app/Expense/expencescreen.dart';
import 'package:khata_app/screens/addcustomer.dart';
import 'package:khata_app/screens/profilescreen.dart';
import 'package:khata_app/screens/shared/addshareddata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _viewAccess = true;

  // ================= BUSINESS SHEET =================
  void _showBusinessSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Your Business",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: const Text("My Khata"),
                trailing: const Icon(Icons.edit_note, color: Colors.grey),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: const Text("My Khata"),
                trailing: const Icon(Icons.edit_note, color: Colors.grey),
                onTap: () => Navigator.pop(context),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF0E6FF),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Add New Business",
                      style: TextStyle(
                        color: Color(0xFF7B4DFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ================= SHARE KHATA SHEET =================
  void _showShareKhataSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Share Khata",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("View Access", style: TextStyle(fontSize: 14)),
                      Switch(
                        value: _viewAccess,
                        activeColor: const Color(0xFF7B4DFF),
                        onChanged: (val) {
                          setSheetState(() => _viewAccess = val);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF0E6FF),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              "Close",
                              style: TextStyle(
                                color: Color(0xFF7B4DFF),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7B4DFF),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              setState(() => _selectedIndex = 2);
                            },
                            child: const Text(
                              "Give",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // ================= MAIN BUILD =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E2D9),

      appBar: _selectedIndex == 2 || _selectedIndex == 3
          ? null
          : AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leadingWidth: 110,
              leading: GestureDetector(
                onTap: _showBusinessSheet,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.keyboard_arrow_down, size: 18),
                      Text(" My Khata", style: TextStyle(fontSize: 11)),
                    ],
                  ),
                ),
              ),
              actions: const [
                Icon(Icons.notifications, color: Colors.deepPurple),
                SizedBox(width: 15),
              ],
            ),

      body: _selectedIndex == 0
          ? _khataScreen()
          : _selectedIndex == 1
              ? const ExpenseScreen()
              : _selectedIndex == 2
                  ? const SharedKhataScreenContent()
                  : const ProfileScreen(),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: const Color(0xFF7B4DFF),
          onTap: (index) {
            if (index == 2) {
              _showShareKhataSheet();
            } else {
              setState(() => _selectedIndex = index);
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Khata'),
            BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Expense'),
            BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Shared'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }

  // ================= KHATA SCREEN =================
  Widget _khataScreen() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _summaryCard(
                  "I have to get",
                  "\$5000",
                  const Color(0xFF008955),
                  Icons.download_rounded,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _summaryCard(
                  "I have to Give",
                  "\$1200",
                  const Color(0xFFE53935),
                  Icons.upload_rounded,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFFE0E0E0),
                      child: Text("A"),
                    ),
                    title: Text("AbuBakr", style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("+92 305 0465228", style: TextStyle(fontSize: 11)),
                    trailing: Text(
                      "\$120",
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          // ================= ADD CUSTOMER BUTTON =================
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7B4DFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 0,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AddCustomerScreen(),
                  ),
                );
              },
              child: const Text(
                "Add Customer",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryCard(String t, String a, Color c, IconData i) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: c,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(i, color: Colors.white, size: 18),
          const SizedBox(height: 10),
          Text(t, style: const TextStyle(color: Colors.white70, fontSize: 10)),
          Text(a, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// ================= SHARED SCREEN =================
class SharedKhataScreenContent extends StatelessWidget {
  const SharedKhataScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        const Text("Shared Khata", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AddSharedData()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const ListTile(
                      title: Text("AbuBakr", style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text("+92 305 0465228", style: TextStyle(fontSize: 12)),
                      trailing: Text(
                        "\$169",
                        style: TextStyle(color: Color(0xFFFF4D4D), fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
