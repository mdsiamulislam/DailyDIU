import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dailydiu/screen/auth/login_screen.dart';

class ProfileHomeScreen extends StatefulWidget {
  static const String id = 'profile_home_screen';

  const ProfileHomeScreen({super.key});

  @override
  State<ProfileHomeScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileHomeScreen> {
  late String name = 'User Name';
  late String email = 'user@example.com';

  @override
  void initState() {
    super.initState();
    // Fetch user data from shared preferences or API
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? 'User Name';
      email = prefs.getString('email') ?? 'user@example.com';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              email,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    // Navigate to settings screen
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    // Clear Shared Preferences and Redirect to Login Screen
                    SharedPreferences.getInstance().then((prefs) {
                      prefs.clear();
                      Navigator.pushReplacementNamed(context, LoginScreen.id);
                    });
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