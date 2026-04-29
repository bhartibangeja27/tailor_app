import 'package:flutter/material.dart';
import 'product_list.dart'; // Ensure karein ke file ka naam 'product_list.dart' hi ho
import 'measurement_screen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8C8C4),
      body: Column(
        children: [
          const SizedBox(height: 50),
          const ListTile(
              leading: Icon(Icons.menu),
              title: Text('Tailor App', style: TextStyle(fontWeight: FontWeight.bold))
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none)
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(15),
              children: [
                _card(Icons.people, 'Customers'),
                // ORDERS par click karne se ProductList screen khulegi
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductList()));
                    },
                    child: _card(Icons.shopping_bag, 'ORDERS')
                ),
                _card(Icons.settings, 'Settings'),
                _card(Icons.cut, 'Tailor'),
              ],
            ),
          ),
          _btn(context, Icons.straighten, 'Measurement'),
          _btn(context, Icons.assessment, 'Summary'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _card(IconData i, String l) => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(i, size: 40, color: const Color(0xFF008080)),
            Text(l, style: const TextStyle(fontWeight: FontWeight.bold))
          ]
      )
  );

  Widget _btn(BuildContext context, IconData i, String l) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
          leading: Icon(i, color: const Color(0xFF008080)),
          title: Text(l),
          onTap: () {
            if(l == 'Measurement') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MeasurementScreen()));
            }
          }
      )
  );
}