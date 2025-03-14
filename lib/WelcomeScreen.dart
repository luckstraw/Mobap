import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient( colors: [
            Color(0xffB81736),
            Color(0xff281537),
            ],
          ),
        ),
        child: Column(children: [
            const Padding(
              padding: EdgeInsets.only(top: 200.0),
              child: Image(image: AssetImage('assets/logo.png')),
            ),
            const SizedBox(height: 100),
            const Text(
              'Welcome Back', 
              style: TextStyle(
                fontSize: 30, color:Colors.white
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                const LoginScreen()));
              },
              child: _buildButton('SIGN IN', Colors.transparent, Colors.white),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                const registration_screen()));
              },
              child: _buildButton('SIGN UP', Colors.white, Colors.black),
            ),
            const Spacer(),
            const Text('Login with Social Media', style: TextStyle(fontSize:
              17, color: Colors.white)),
            const SizedBox(height: 12),
            const Image(image: AssetImage('assets/social.png')),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color bgColor, Color textColor) {
    return Container(
      height: 53,
      width: 320,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white),
      ),
      child: Center(
        child: Text(text, style: TextStyle(fontSize: 20, fontWeight:
        FontWeight.bold, color: textColor)),
      ),
    );
  }
}