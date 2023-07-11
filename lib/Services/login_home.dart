import 'package:flutter/material.dart';
import 'package:spirit_summoner/Services/loginHub.dart';
import 'package:spirit_summoner/Services/loadingScreen.dart';
import 'package:spirit_summoner/Services/auth.dart';
import 'package:spirit_summoner/Services/errorScreen.dart';
import 'package:spirit_summoner/Home/home.dart';

class LoginHomeScreen extends StatelessWidget {
  const LoginHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return const Center(
            child: ErrorScreen(),
          );
        } else if (snapshot.hasData) {
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
