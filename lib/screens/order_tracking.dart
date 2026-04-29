import 'package:flutter/material.dart';

class OrderTracking extends StatelessWidget {
  const OrderTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Track Order'), backgroundColor: const Color(0xFF008080)),
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Icon(Icons.timelapse, size: 80, color: Color(0xFF008080)),
          const Text(
            'Order Status: Processing',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const ListTile(
            leading: Icon(Icons.check_circle, color: Colors.green),
            title: Text('Order Received'),
          ),
          const ListTile(
            leading: Icon(Icons.radio_button_checked, color: Colors.blue),
            title: Text('In Progress (Stitching)'),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () => Navigator.popUntil(context, (r) => r.isFirst),
              child: const Text('Back to Dashboard'),
            ),
          ),
        ],
      ),
    );
  }
}