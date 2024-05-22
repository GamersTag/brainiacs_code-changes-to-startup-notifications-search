import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotoficationPage extends StatefulWidget {
  const NotoficationPage({super.key});

  @override
  State<NotoficationPage> createState() => _NotoficationPageState();
}

class _NotoficationPageState extends State<NotoficationPage> {
  List<String> notifications = [];

  @override
  void initState() {
    super.initState();
    // Simulate receiving a notification
    simulateNotification();
  }

  void simulateNotification() {
    setState(() {
      notifications.add("New Notification");
      notifications.add("New Notification 2");
      notifications.add("New Notification 3");
      notifications.add("New Notification 4");

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'NOTIFICATIONS',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20), // Add some space between the title and the notifications
            ListView.builder(
              shrinkWrap: true,
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(8.0), // Add some margin around each notification box
                  padding: EdgeInsets.all(8.0), // Add some padding inside each notification box
                  decoration: BoxDecoration(
                    color: Colors.blue[200], // Background color for the notification box
                    borderRadius: BorderRadius.circular(10.0), // Rounded corners for the notification box
                  ),
                  child: Text(
                    notifications[index],
                    style: TextStyle(
                      color: Colors.white, // Text color
                      fontSize: 16.0, // Text size
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
