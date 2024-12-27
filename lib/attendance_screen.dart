import 'package:flutter/material.dart';
import 'package:flutter_project2/map_screen.dart';
import 'package:flutter_project2/map_screen3.dart'; 
import 'package:flutter_project2/map_screen2.dart';
import 'member.dart';

class AttendanceScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Attendance',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 72, 29, 201),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
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
                      "C",
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
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Attendance'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Activity'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.timer_outlined),
              title: Text('Timesheet'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.assessment),
              title: Text('Report'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Jobsite'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('Team'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Time off'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: Text('Schedules'),
              onTap: () {},
            ),
            Divider(),
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
            Divider(), 
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
          if (index == 0) {
            // "All Members" row
            return Container(
              color: Colors.grey[200],
              child: ListTile(
                leading: Icon(
                  Icons.groups,
                ),
                title: Text(
                  "All Members",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AllMembersScreen(), 
                    ),
                  );
                },
              ),
            );
          }  
          final member = fakeMembers[index];
          return ListTile( 
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                  member.imageAssetPath), 
              radius: 20, 
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
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.calendar_today,
                      color: const Color.fromARGB(255, 96, 39, 176)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapScreen2(
                          name: member.name,
                          latitude: member.latitude, 
                          longitude: member.longitude,
                          visitedPlaces:
                              member.visitedPlaces, 
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.my_location, color: Colors.orange),
                  onPressed: () {
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MapScreen3(
                  members: fakeMembers, 
                ),
              ),
            );
          },
          child: Text('Show All Members on Map'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 251, 232, 254),
          ),
        ),
      ),
    );
  }
}

class AllMembersScreen extends StatefulWidget {
  @override
  _AllMembersScreenState createState() => _AllMembersScreenState();
}

class _AllMembersScreenState extends State<AllMembersScreen> {
  List<Member> filteredMembers = fakeMembers;
  TextEditingController _searchController = TextEditingController();

  void _filterMembers(String query) {
    setState(() {
      filteredMembers = fakeMembers.where((member) {
        return member.name.toLowerCase().contains(query.toLowerCase()) ||
            member.id.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _filterMembers(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Members"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Members',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), 
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), 
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredMembers.length,
        itemBuilder: (context, index) {
          final member = filteredMembers[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 18,
              // backgroundImage: member.profileImg.image,
            ),
            title: Row(
              children: [
                Text("${member.name}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
