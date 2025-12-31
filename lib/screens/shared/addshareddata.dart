import 'package:flutter/material.dart';

class AddSharedData extends StatelessWidget {
  const AddSharedData({super.key});

  // --- 1. Add Comment Bottom Sheet ---
  void _showAddCommentSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10))),
            const SizedBox(height: 20),
            const Text("Add Comment", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "Comment",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.grey.shade200)
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: _sheetButton("Close", const Color(0xFFF0E6FF), const Color(0xFF7B4DFF), () => Navigator.pop(context))),
                const SizedBox(width: 15),
                Expanded(child: _sheetButton("Add", const Color(0xFF7B4DFF), Colors.white, () => Navigator.pop(context))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper for sheet buttons
  Widget _sheetButton(String txt, Color bg, Color tx, VoidCallback tap) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: bg,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
        ),
        onPressed: tap,
        child: Text(txt, style: TextStyle(color: tx, fontWeight: FontWeight.bold)),
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
        title: Column(
          children: const [
            Text("Customer Details", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
            Text("AbuBakr", style: TextStyle(color: Colors.black54, fontSize: 14)),
            Text("+92 305 0465228", style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Green Summary Card
          GestureDetector(
            onTap: () {
            _showAddCommentSheet(context);
            },
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF00A36C),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.download_rounded, color: Colors.white),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("I have to get", style: TextStyle(color: Colors.white70, fontSize: 12)),
                      Text("\$5000", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => _buildTransactionTile(context, index == 2),
            ),
          ),
          // Bottom Buttons (Fixed Call)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(child: _actionButton("I GAVE", const Color(0xFFFFD1D1), Colors.red, Icons.arrow_upward)),
                const SizedBox(width: 15),
                Expanded(child: _actionButton("I Got", const Color(0xFFC7F2E3), const Color(0xFF00A36C), Icons.arrow_downward)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Transaction Tile Widget ---
  Widget _buildTransactionTile(BuildContext context, bool isRed) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("18-09, 11:36 PM", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(5)),
                child: const Text("Bal. \$700", style: TextStyle(fontSize: 10, color: Colors.grey)),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("\$120", style: TextStyle(color: isRed ? Colors.red : const Color(0xFF00A36C), fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => _showAddCommentSheet(context), // Sheet Call
                child: const Text(
                    "Add Comment",
                    style: TextStyle(color: Color(0xFF7B4DFF), fontSize: 10)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- Action Button Widget (This was causing the error) ---
  Widget _actionButton(String label, Color bg, Color textCol, IconData icon) {
    return Container(
      height: 55,
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: textCol, size: 18),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(color: textCol, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}