import 'package:flutter/material.dart';
import 'package:spirit_summoner/pages/login/loginHub.dart';
import 'package:spirit_summoner/pages/loading/loadingScreen.dart';
import 'package:spirit_summoner/domain/authentication/auth.dart';
import 'package:spirit_summoner/pages/error/errorScreen.dart';
import 'package:spirit_summoner/pages/home/view/homeHub.dart';

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
