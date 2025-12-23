import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';


class CashEntryScreen extends StatefulWidget {
  final String screenTitle;

  const CashEntryScreen({super.key, required this.screenTitle});

  @override
  State<CashEntryScreen> createState() => _CashEntryScreenState();
}

class _CashEntryScreenState extends State<CashEntryScreen> {
  File? _selectedImage; // Selected image save karne ke liye variable

  // Image pick karne ka function
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    // Gallery se image select karna
   final XFile? image = await picker.pickImage(source: ImageSource.gallery);


    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
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
        title: Text(widget.screenTitle,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildInputField(hint: "\$ 52"),
            const SizedBox(height: 15),
            _buildInputField(hint: "Details (Optional)"),
            const SizedBox(height: 15),

            // --- Dynamic Attachment Section ---
            GestureDetector(
              onTap: _pickImage, // Click karne par gallery khulegi
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade50,
                ),
                child: _selectedImage == null
                    ? Column( // Agar image select nahi hui
                  children: [
                    Icon(Icons.attach_file, color: Colors.grey.shade400),
                    const SizedBox(height: 8),
                    const Text("Add attachment", style: TextStyle(color: Colors.grey)),
                  ],
                )
                    : Column( // Agar image select ho gayi
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(_selectedImage!, height: 100, width: 100, fit: BoxFit.cover),
                    ),
                    const SizedBox(height: 8),
                    const Text("Image Added", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // Save Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7B4DFF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text("Save", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({required String hint}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.deepPurple, width: 1),
        ),
      ),
    );
  }
}