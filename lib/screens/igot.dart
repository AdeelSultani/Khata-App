import 'package:flutter/material.dart';

class IGotScreen extends StatelessWidget {
  final String Name; // This receives "I Gave" or "I Got"

  const IGotScreen({super.key, required this.Name});

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
        // Displaying the dynamic Name passed from previous screen
        title: Text(
          "$Name (Abubkr)",
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildTextField(hint: "\$ 52", isBold: true),
            const SizedBox(height: 15),
            _buildTextField(hint: "Details (Optional)"),
            const SizedBox(height: 15),

            // Date Picker Box
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade200), borderRadius: BorderRadius.circular(12)),
              child: Row(children: const [
                Icon(Icons.calendar_month, color: Colors.grey, size: 20),
                SizedBox(width: 10),
                Text("23/04, 03:45PM"),
                Spacer(),
                Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              ]),
            ),

            const SizedBox(height: 15),

            // Attachment Box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade200), borderRadius: BorderRadius.circular(12)),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
                Icon(Icons.attach_file, color: Colors.grey),
                SizedBox(width: 8),
                Text("Add attachment", style: TextStyle(color: Colors.grey)),
              ]),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7B4DFF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text("Save", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String hint, bool isBold = false}) {
    return TextField(
      style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
      decoration: InputDecoration(
        hintText: hint,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade200)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF7B4DFF))),
      ),
    );
  }
}