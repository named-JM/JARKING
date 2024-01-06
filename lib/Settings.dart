import 'package:final_project_for_flutter_by_jarling/login.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.black,
      ),
      body: SettingsContent(),
    );
  }
}

class SettingsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Account Settings'),
          subtitle: Text('Manage your account information'),
          onTap: () {
            // Add logic to navigate to the account settings page
            // For example:
            // Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSettingsPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text('Notification Settings'),
          subtitle: Text('Configure your notification preferences'),
          onTap: () {
            // Add logic to navigate to the notification settings page
            // For example:
            // Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationSettingsPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Sign Out'),
          onTap: () {
            // Add logic to sign out and navigate back to the login page
            // For example:
            _signOutAndNavigateToLogin(context);
          },
        ),
      ],
    );
  }

  void _signOutAndNavigateToLogin(BuildContext context) {
    // Add sign-out logic here if needed

    // Navigate back to the login page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
