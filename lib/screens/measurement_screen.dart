import 'package:flutter/material.dart';
import 'order_placement.dart';

class MeasurementScreen extends StatelessWidget {
  const MeasurementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Measurements'), backgroundColor: const Color(0xFF008080)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _in('Shoulder'), _in('Chest'), _in('Length'), _in('Sleeves'),
          const SizedBox(height: 30),
          ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderPlacement())), child: const Text('Review Order')),
        ],
      ),
    );
  }
  Widget _in(String l) => Padding(padding: const EdgeInsets.only(bottom: 10), child: TextField(decoration: InputDecoration(labelText: l, border: const OutlineInputBorder())));
}