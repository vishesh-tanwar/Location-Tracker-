import 'package:flutter/material.dart';
import 'package:flutter_project2/map_screen.dart';
import 'member.dart';

class AttendanceScreen extends StatelessWidget {
  // Create a global key to control the Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the global key to the Scaffold
      appBar: AppBar(
        title: Text(
          'Attendance',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 72, 29, 201),
        leading: IconButton(
          icon: Icon(Icons.menu), // Three-line menu icon
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer(); // Open the drawer
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Text(
                      "C", // Placeholder for user profile image or initials
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Vinove Software & services',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'v&s@gmail.com',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.timer),
              title: Text('Timer'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Attendance'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Activity'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.timer_outlined),
              title: Text('Timesheet'),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              leading: Icon(Icons.assessment),
              title: Text('Report'),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Jobsite'),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('Team'),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Time off'),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: Text('Schedules'),
              onTap: () {
                // Handle logout
              },
            ),
            Divider(), // Line added after Schedules
            ListTile(
              leading: Icon(Icons.how_to_reg),
              title: Text('Request to Join Organisation'),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Change Password'),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Handle logout
              },
            ),
            Divider(), // Line added after Logout
            ListTile(
              leading: Icon(Icons.help),
              title: Text('FAQ & Help'),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text('Privacy Policy'),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Version: 2,10(2)'),
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: fakeMembers.length,
        itemBuilder: (context, index) {
          final member = fakeMembers[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(member.name[0]), // Placeholder for profile image
            ),
            title: Text('${member.name} (${member.id})'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Check-in: ${member.checkInTime ?? 'N/A'}'),
                Text('Check-out: ${member.checkOutTime ?? 'N/A'}'),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize
                  .min, // Ensures the Row takes only as much space as its children
              children: [
                Icon(Icons.calendar_today, color: const Color.fromARGB(255, 96, 39, 176)), // First icon
                SizedBox(width: 8), // Spacing between icons
                // Icon(Icons.my_location, color: Colors.orange), // Second icon
                IconButton(
                  icon: Icon(Icons.my_location, color: Colors.orange),
                  onPressed: () {
                    // Navigate to the MapScreen with the member's location data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapScreen(
                          latitude: member.latitude,
                          longitude: member.longitude,
                          name: member.name,
                        ),
                      ),
                    );
                  },
                ),
              ], 
            ),
          );
        },
      ),
    );
  }
}
