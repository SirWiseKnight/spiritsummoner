import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spirit_summoner/Quest/areaSummary.dart';
import 'package:spirit_summoner/Shared/barrel.dart';
import 'package:spirit_summoner/Shared/bottomNavNew.dart';

class QuestScreen extends StatelessWidget {
  const QuestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: Column(
            children: [
              AppBarPane(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Partner',
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 50, 215, 75).withOpacity(0.75),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100.0),
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        print("You pressed the Spirits button!");
                      },
                      child: Text(
                        'Spirits',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 16.0,
                  left: 16.0,
                  top: 16.0,
                ),
                child: SpiritCard(),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: AreaList(),
              ),
              Expanded(child: Container()),
              BottomNavBubbles(),
            ],
          ),
        ),
      ),
    );
  }
}
