import 'package:flutter/material.dart';

import 'addcustomer.dart';
class Searchcontact extends StatelessWidget {
  const Searchcontact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, elevation: 0,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back, color: Colors.black)),
        title: const Text("Add customer", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search Contact",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true, fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: Colors.grey.shade200)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Colors.deepPurple)),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.person_add_alt_1, color: Colors.black),
              title: const Text("Add a new customer", style: TextStyle(fontWeight: FontWeight.w500)),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder:(context)
                {
                  return AddCustomerScreen();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}