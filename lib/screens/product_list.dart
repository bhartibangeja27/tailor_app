import 'package:flutter/material.dart';
import 'product_detail.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8C8C4),
      appBar: AppBar(title: const Text('Designs Listing'), backgroundColor: Colors.white, foregroundColor: Colors.black),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(10), child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [Text('Received'), Text('Processing'), Text('Delivered')])),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: const Icon(Icons.style, color: Color(0xFF008080)),
                  title: Text('Suit Design ${index + 1}'),
                  trailing: ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductDetail())), child: const Text('Details')),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}