import 'package:brainiacs/signup.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';

class StartupPage extends StatelessWidget {
  const StartupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.purple], // Define your gradient colors here
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10), // Optional: Add rounded corners
              ),
              child: Text('Brainiacs',
                style: TextStyle(
                  fontSize: 24, // Adjust the font size as needed
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color
                ),
                textAlign: TextAlign.center, // Center-align the text
              ),
            ),
            SizedBox(height: 20), // Add some space between the text and the logo
            Image.asset('assets/images/logo.jpeg', width: 200, height: 200),
            SizedBox(height: 20), // Add some space between the logo and the buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text("Login Page"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: Text("Signup Page"),
            ),
          ],
        ),
      ),
    );
  }
}
