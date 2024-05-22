import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(color: Colors.white),
          ),
        ),
        automaticallyImplyLeading: false,

        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage('assets/images/user1.jpg'),
                        ),
                        Column(
                          children: [
                            Text(
                              'John Doe', // Replace with actual user name
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Software Engineer', // Replace with actual designation
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 10),
                            Row(
                              // Add social media icons if applicable (consider using a Row or Wrap)
                            ),
                            Container(
                              width: 140,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Implement change image functionality
                                },
                                child: Text('Change Image'),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.blue,
                                ),
                              ),
                            ),
                            Container(
                              width: 140,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Implement edit profile functionality
                                },
                                child: Text('Edit Profile'),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1, // Adjust divider thickness as needed
                      color: Colors.grey[300], // Customize divider color
                    ),
                    SizedBox(height: 10), // Add some space below the divider
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.person, size: 24, color: Colors.blue),
                        SizedBox(width: 10),
                        Icon(Icons.email, size: 24, color: Colors.blue),
                        SizedBox(width: 10),
                        Icon(Icons.phone, size: 24, color: Colors.blue),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  leading: Icon(Icons.account_circle, color: Colors.blue),
                  title: Text(
                    'Account Details',
                    style: TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AccountDetailsPage()),
                    );
                  },
                ),
                Divider(
                  thickness: 1, // Adjust divider thickness as needed
                  color: Colors.grey[300], // Customize divider color
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  leading: Icon(Icons.settings, color: Colors.blue),
                  title: Text(
                    'Settings',
                    style: TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                ),
                Divider(
                  thickness: 1, // Adjust divider thickness as needed
                  color: Colors.grey[300], // Customize divider color
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  leading: Icon(Icons.exit_to_app, color: Colors.blue),
                  title: Text(
                    'Logout',
                    style: TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                  onTap: () {
                    // Add logout functionality here
                    Navigator.pop(context); // Go back to previous screen
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}

class AccountDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Details', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Account Details Page'),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}