import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {

  static final String id = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String Token = '';
    void GetToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      Token = token!;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(Token),
          ],
        ),
      ),
    );
  }
}
