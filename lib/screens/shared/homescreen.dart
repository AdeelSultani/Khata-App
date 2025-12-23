import 'package:flutter/material.dart';
import 'package:khata_app/shared/addshareddata.dart';
// Apne project ke mutabiq imports ko check kar lein
// import 'package:khattaapp/Screens/shared/addshareddata.dart';
// import 'Expense/expencescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _viewAccess = true;

  // --- 1. Your Business Sheet ---
  void _showBusinessSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10))),
            const SizedBox(height: 20),
            const Text("Your Business", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            _businessItem("My Khata"),
            _businessItem("My Khata"),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF0E6FF), elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.pop(context);
                    _showAddBusinessSheet();
                  },
                  child: const Text("Add New Business", style: TextStyle(color: Color(0xFF7B4DFF), fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddBusinessSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: MediaQuery.of(context).viewInsets.bottom + 20),
        decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Add New Business", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(decoration: InputDecoration(hintText: "Business Name", border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: Colors.grey.shade200)))),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: _sheetButton("Close", const Color(0xFFF0E6FF), const Color(0xFF7B4DFF), () => Navigator.pop(context))),
                const SizedBox(width: 15),
                Expanded(child: _sheetButton("Add New", const Color(0xFF7B4DFF), Colors.white, () => Navigator.pop(context))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // --- 2. Share Khata Sheet (Give Button Logic) ---
  void _showShareKhataSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setSheetState) => Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10))),
              const SizedBox(height: 20),
              const Text("Share Khata", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("View Access", style: TextStyle(fontSize: 14)),
                  Switch(value: _viewAccess, activeColor: const Color(0xFF7B4DFF), onChanged: (val) => setSheetState(() => _viewAccess = val)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: _sheetButton("Close", const Color(0xFFF0E6FF), const Color(0xFF7B4DFF), () => Navigator.pop(context))),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _sheetButton(
                      "Give",
                      const Color(0xFF7B4DFF),
                      Colors.white,
                          () {
                        Navigator.pop(context);
                        setState(() => _selectedIndex = 2); // Shared screen par le jayein
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E2D9),
      appBar: _selectedIndex == 2 ? null : AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: _showBusinessSheet,
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.5), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey.shade300)),
            child: Row(children: const [Icon(Icons.keyboard_arrow_down, size: 18), Text(" My Khata", style: TextStyle(fontSize: 11))]),
          ),
        ),
        leadingWidth: 110,
        actions: [const Icon(Icons.notifications, color: Colors.deepPurple), const SizedBox(width: 15)],
      ),
      body: _selectedIndex == 0
          ? Stack(children: [_buildHome(), _buildAddCustomerButton()])
          : (_selectedIndex == 2 ? const SharedKhataScreenContent() : const Center(child: Text("Expense/Profile Screen"))),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHome() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(children: [
            _summaryCard("I have to get", "\$5000", const Color(0xFF008955), Icons.download_rounded),
            const SizedBox(width: 12),
            _summaryCard("I have to Give", "\$1200", const Color(0xFFE53935), Icons.upload_rounded),
          ]),
          const SizedBox(height: 20),
          Expanded(child: ListView.builder(itemCount: 8, itemBuilder: (context, i) => _customerTile())),
        ],
      ),
    );
  }

  Widget _buildAddCustomerButton() {
    return Positioned(bottom: 20, left: 0, right: 0, child: Center(child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7B4DFF), padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))), onPressed: () {}, child: const Text("Add Customer", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))));
  }

  Widget _customerTile() {
    return Container(margin: const EdgeInsets.only(bottom: 10), decoration: BoxDecoration(color: Colors.white.withOpacity(0.7), borderRadius: BorderRadius.circular(15)), child: const ListTile(leading: CircleAvatar(backgroundColor: Color(0xFFE0E0E0), child: Text("A")), title: Text("AbuBakr", style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text("+92 305 0465228", style: TextStyle(fontSize: 11)), trailing: Text("\$120", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))));
  }

  Widget _summaryCard(String t, String a, Color c, IconData i) {
    return Expanded(child: Container(padding: const EdgeInsets.all(15), decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(20)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(i, color: Colors.white, size: 18), const SizedBox(height: 10), Text(t, style: const TextStyle(color: Colors.white70, fontSize: 10)), Text(a, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))])));
  }

  Widget _sheetButton(String txt, Color bg, Color tx, VoidCallback tap) {
    return SizedBox(height: 50, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: bg, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))), onPressed: tap, child: Text(txt, style: TextStyle(color: tx, fontWeight: FontWeight.bold))));
  }

  Widget _businessItem(String name) {
    return ListTile(title: Text(name), trailing: const Icon(Icons.edit_note, color: Colors.grey), onTap: () => Navigator.pop(context));
  }

  Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) {
          if (i == 2 && _selectedIndex != 2) _showShareKhataSheet();
          else setState(() => _selectedIndex = i);
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: const Color(0xFF7B4DFF),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Khata'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Expense'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Shared'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// --- Shared Khata Screen Content (Clickable Tiles) ---
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => _buildSharedCustomerTile(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSharedCustomerTile(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AddSharedData()));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          leading: Container(width: 50, height: 50, decoration: BoxDecoration(color: const Color(0xFFF2F2F2), borderRadius: BorderRadius.circular(12)), child: const Center(child: Text("A", style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold)))),
          title: const Text("AbuBakr", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          subtitle: const Text("+92 305 0465228", style: TextStyle(color: Colors.grey, fontSize: 12)),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text("\$169", style: TextStyle(color: Color(0xFFFF4D4D), fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 4),
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: const Color(0xFFF0E6FF), borderRadius: BorderRadius.circular(8)), child: const Text("Shared", style: TextStyle(color: Color(0xFF7B4DFF), fontSize: 10, fontWeight: FontWeight.bold))),
            ],
          ),
        ),
      ),
    );
  }
}