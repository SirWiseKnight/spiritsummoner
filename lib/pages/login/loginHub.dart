import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spirit_summoner/pages/home/view/homeHub.dart';
import 'package:spirit_summoner/domain/authentication/auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:spirit_summoner/pages/sign_up/signupHub.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(),
            ),
            const FlutterLogo(
              size: 150,
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Container(
                child: Text(
                  'Welcome back, Summoner',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Container(
                child: Text(
                  'Get back to your adventure!',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                  //Do something with the user input.
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Email')),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                  //Do something with the user input.
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Password')),
            SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Icon(FontAwesomeIcons.user),
                      ),
                    ),
                    Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email, password: password);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }
                    ;
                  }
                }),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'or',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            LoginButton(
              text: 'Sign in with Google',
              icon: FontAwesomeIcons.google,
              color: Colors.red,
              loginMethod: AuthService().googleLogin,
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder<Object>(
              future: SignInWithApple.isAvailable(),
              builder: (context, snapshot) {
                if (snapshot.data == true) {
                  return SignInWithAppleButton(
                    onPressed: () {
                      AuthService().signInWithApple();
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Container(
                    child: Text(
                      'New to Spirit Summoner?',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationScreen()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;

  const LoginButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.color,
      required this.loginMethod});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ElevatedButton.icon(
        icon: Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
        style: TextButton.styleFrom(
          backgroundColor: color,
          textStyle: GoogleFonts.poppins(fontSize: 16),
        ),
        onPressed: () => loginMethod(),
        label: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
}
