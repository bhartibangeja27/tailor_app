import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8C8C4),
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Text('Sign Up', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF008080))),
            const SizedBox(height: 20),
            _f('Full Name'), _f('Email'), _f('Password', p: true),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('CREATE ACCOUNT')),
          ],
        ),
      ),
    );
  }
  Widget _f(String h, {bool p = false}) => Padding(padding: const EdgeInsets.only(bottom: 10), child: TextField(obscureText: p, decoration: InputDecoration(hintText: h, filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none))));
}