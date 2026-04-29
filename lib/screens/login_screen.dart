import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8C8C4),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Tailor App', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF008080))),
            const SizedBox(height: 40),
            _box('username'),
            const SizedBox(height: 15),
            _box('Enter Password', isPass: true),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Dashboard())),
              child: const Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12), child: Text('Login', style: TextStyle(color: Colors.black))),
            ),
            TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen())),
                child: const Text("Don't have an account? Sign Up", style: TextStyle(color: Colors.black))),
          ],
        ),
      ),
    );
  }
  Widget _box(String h, {bool isPass = false}) => TextField(obscureText: isPass, decoration: InputDecoration(hintText: h, filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none)));
}