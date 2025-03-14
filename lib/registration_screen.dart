import 'package:flutter/material.dart';

class registration_screen extends StatelessWidget {
  const registration_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: _buildRegistrationForm(),
          ),
        ],
      )
    );
  }

  Widget _buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xffB81736),
        Color(0xff281537)]),
      ),
      child: const Padding(
        padding: EdgeInsets.only(top: 60.0, left: 22),
        child: Text('Create Your\nAccount', style: TextStyle(fontSize: 30, color:
        Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildRegistrationForm() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40),
        topRight: Radius.circular(40)),
        color: Colors.white,
        ),
        height: double.infinity,
        width: double.infinity,
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            _buildTextField('Full Name', Icons.check),
            _buildTextField('Phone or Gmail', Icons.check),
            _buildTextField('Password', Icons.visibility_off),
            _buildTextField('Confirm Password', Icons.visibility_off),
            const SizedBox(height: 40),
            _buildSignInButton(),
          ],
        ),
      ),
    );
  }

  
  Widget _buildTextField(String label, IconData icon) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: Icon(icon, color: Colors.grey),
        label: Text(label, style: const TextStyle(fontWeight:
        FontWeight.bold, color: Color(0xffB81736))),
      ),
    );
  }

  Widget _buildSignInButton() {
    return Container(
      height: 55,
      width: 300,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      gradient: const LinearGradient(colors: [Color(0xffB81736),
        Color(0xff281537)]),
      ),
      child: const Center(
        child: Text('SIGN IN', style: TextStyle(fontWeight: FontWeight.bold,
        fontSize: 20, color: Colors.white)),
      ),
    );
  }
}