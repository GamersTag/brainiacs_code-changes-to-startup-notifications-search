import 'package:brainiacs/Home/dashboard.dart';
import 'package:brainiacs/signup.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person), // Add username icon
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blue), // Change border color
                    ),
                  ),
                ),
                const SizedBox(height: 10.0), // Spacing between text fields
                TextField(
                  controller: _passwordController,
                  obscureText: true,  // Hide password input
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock), // Add password icon
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blue), // Change border color
                    ),
                  ),
                ),
                const SizedBox(height: 20.0), // Spacing between text fields and button
                ElevatedButton(
                  onPressed: () {
                    // Handle login button press (e.g., validate credentials)
                    print('Username: ${_usernameController.text}');
                    print('Password: ${_passwordController.text}');

                    // Navigate to Dashboard using pushReplacement
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );

                  },

                  child: Text('Login',style: TextStyle(color: Colors.white),),
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
                    Text('Not a user?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
                        // Handle forgot password functionality (e.g., navigate to a reset page)
                        print('Forgot password clicked');
                      },
                      child: Text('Register'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.blue[900], // Change text color for Forgot Password
                      ),
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
