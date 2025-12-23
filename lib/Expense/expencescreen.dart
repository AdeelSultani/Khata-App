import 'package:flutter/material.dart';

import 'addexpense.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});

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
        title: const Text("Expense", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Status Cards (Cash in hand & Balance)
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                _topStatusCard("Cash in hand", "\$5000", const Color(0xFF00A661)),
                const SizedBox(width: 15),
                _topStatusCard("Today's balance", "\$1200", const Color(0xFFFF4D4D)),
              ],
            ),
          ),

          // Transactions List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: [
                _expenseItem("Description like here", "25/05 11:36 PM", "\$120", const Color(0xFF00A661)),
                _expenseItem("Lunch", "25/05 01:30 PM", "\$50", Colors.redAccent),
              ],
            ),
          ),

          // Bottom Buttons with Navigation
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const CashEntryScreen(screenTitle: "Cash Out"))),
                    child: _actionButton("CASH OUT", const Color(0xFFFFD5D5), Colors.red, Icons.remove),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const CashEntryScreen(screenTitle: "Cash In"))),
                    child: _actionButton("CASH IN", const Color(0xFFC7EFE0), const Color(0xFF00A661), Icons.add),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _topStatusCard(String title, String amount, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.white70, fontSize: 12)),
            Text(amount, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _expenseItem(String title, String subtitle, String amount, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: const Color(0xFFF9F9F9), borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
            Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 11)),
          ]),
          Text(amount, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _actionButton(String label, Color bgColor, Color textColor, IconData icon) {
    return Container(
      height: 55,
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: textColor, size: 20),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}