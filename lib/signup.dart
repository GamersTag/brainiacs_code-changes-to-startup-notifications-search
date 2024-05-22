import 'package:brainiacs/LoginPage.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Logo (replace with your logo image)
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.asset('assets/images/logo.jpeg'), // Replace with your logo image path
                  ),
                ),
                const SizedBox(height: 20.0), // Spacing between logo and text fields
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,  // Set keyboard type for email input
                ),
                const SizedBox(height: 10.0), // Spacing between text fields
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0), // Spacing between text fields
                TextField(
                  controller: _passwordController,
                  obscureText: true,  // Hide password input
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0), // Spacing between text fields
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,  // Hide confirm password input
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0), // Spacing between text fields and button
                ElevatedButton(
                  onPressed: () {

                    // Handle signup button press (e.g., validate user input, process registration)
                    print('Email: ${_emailController.text}');
                    print('Username: ${_usernameController.text}');
                    print('Password: ${_passwordController.text}');
                    print('Confirm Password: ${_confirmPasswordController.text}');
                  },
                  child: Text('Sign Up',style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50), // Stretch button across screen
                    backgroundColor: Colors.blue[900], // Change button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0), // Spacing below button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        // Navigate back to Login page
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),)); // Use Navigator.pop to go back
                      },
                      child: Text('Login',style: TextStyle(color: Colors.blue[900]),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
