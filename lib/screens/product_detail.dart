import 'package:flutter/material.dart';
import 'measurement_screen.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Detail'), backgroundColor: const Color(0xFF008080)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(height: 200, width: double.infinity, color: Colors.grey[300], child: const Icon(Icons.image, size: 80)),
            const SizedBox(height: 20),
            const Text('Embroidered Kurta', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text('Price: Rs. 2500'),
            const Spacer(),
            ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MeasurementScreen())), child: const Text('Go to Measurements')),
          ],
        ),
      ),
    );
  }
}