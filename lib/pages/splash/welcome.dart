import 'package:flutter/material.dart';
import 'package:spirit_summoner/pages/login/login_home.dart';
import 'package:spirit_summoner/pages/sign_up/signupHub.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('New Summoner'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationScreen()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Returning Summoner'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginHomeScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
