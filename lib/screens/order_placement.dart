import 'package:flutter/material.dart';
import 'order_tracking.dart';

class OrderPlacement extends StatelessWidget {
  const OrderPlacement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Place Order')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_cart, size: 100, color: Color(0xFF008080)),
            const Text('Confirm your tailoring order', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 40),
            ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderTracking())), child: const Text('CONFIRM & SAVE')),
          ],
        ),
      ),
    );
  }
}