import 'package:flutter/material.dart';
import '../igot.dart';

class SpecificCustomerDetail extends StatefulWidget {
  const SpecificCustomerDetail({super.key});

  @override
  State<SpecificCustomerDetail> createState() => _SpecificCustomerDetailState();
}

class _SpecificCustomerDetailState extends State<SpecificCustomerDetail> {
  // Is variable se hum track karenge ke kaunsa item expand hua hai
  int? expandedIndex;

  void _navigateToTransaction(String selectedType) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IGotScreen(Name: selectedType),
      ),
    );
  }

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
        title: const Text("Customer Details",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Text("AbuBakr", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Text("+92 305 0465228", style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 20),

          _buildStatusCard(),

          const SizedBox(height: 20),
          const Divider(thickness: 1),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: [
                _transactionItem(0, "18-09, 11:36 PM", "\$120", const Color(0xFF00A661), "Bal: 3700"),
                _transactionItem(1, "19-09, 10:20 AM", "\$500", Colors.redAccent, "Bal: 3200"),
              ],
            ),
          ),

          _buildBottomButtons(),
        ],
      ),
    );
  }

  Widget _transactionItem(int index, String dateTime, String amount, Color color, String bal) {
    bool isExpanded = expandedIndex == index;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                // Agar wahi index dubara click ho to band kar do, warna naya expand karo
                expandedIndex = isExpanded ? null : index;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                borderRadius: isExpanded
                    ? const BorderRadius.vertical(top: Radius.circular(15))
                    : BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(dateTime, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 6),
                      _buildBalanceBadge(bal),
                    ],
                  ),
                  Row(
                    children: [
                      Text(amount, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 17)),
                      Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Image Expansion Section (Jaisa image_a013fa.png me hai)
          if (isExpanded)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
                border: Border.all(color: Colors.grey.shade100),
              ),
              child: Column(
                children: [
                  // Yahan aapki upload ki hui image show hogi
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://via.placeholder.com/300x150', // Replace with your uploaded image path
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Delete aur Edit buttons (Jaisa image_95c081.png me hai)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _iconButton(Icons.delete_outline, Colors.red),
                      const SizedBox(width: 10),
                      _iconButton(Icons.edit_outlined, Colors.blue),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // Helper widgets for clean code
  Widget _buildBalanceBadge(String bal) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(6)),
      child: Text(bal, style: const TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.bold)),
    );
  }

  Widget _iconButton(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
      child: Icon(icon, color: color, size: 20),
    );
  }

  Widget _buildStatusCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: const Color(0xFF00A661), borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            const Icon(Icons.download, color: Colors.white),
            const SizedBox(width: 15),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
              Text("I have to get", style: TextStyle(color: Colors.white70, fontSize: 12)),
              Text("\$5000", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(child: _actionButton("I GAVE", const Color(0xFFFFD5D5), Colors.red, Icons.arrow_upward, "I gave")),
          const SizedBox(width: 15),
          Expanded(child: _actionButton("I Got", const Color(0xFFC7EFE0), const Color(0xFF00A661), Icons.arrow_downward, "I got")),
        ],
      ),
    );
  }

  Widget _actionButton(String label, Color bgColor, Color textColor, IconData icon, String type) {
    return GestureDetector(
      onTap: () => _navigateToTransaction(type),
      child: Container(
        height: 55,
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(15)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, color: textColor, size: 18),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
        ]),
      ),
    );
  }
}