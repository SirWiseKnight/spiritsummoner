import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spirit_summoner/pages/home/view/homeHub.dart';
import 'package:spirit_summoner/pages/login/loginHub.dart';

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

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
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
                  'Welcome to Spirit Summoner',
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
                  'Fill out your Summoner Registry form!',
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
                    'Register',
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
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  } else
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                } catch (e) {
                  print(e);
                }
                setState(() {
                  showSpinner = false;
                });
              },
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'or',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: null,
              child: Text(
                'Google Sign Up',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text(
                'Apple Sign Up',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
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
                      'Already have an account?',
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
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      'Log In',
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
