import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpiritActionButtons extends StatelessWidget {
  const SpiritActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              right: 8.0,
            ),
            child: Container(
              height: 40,
              width: 130,
              child: ElevatedButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(
                      Colors.redAccent.shade100),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
                onPressed: () {
                  print("You pressed the Level Up Button!");
                },
                child: Container(
                  width: 70,
                  alignment: Alignment.center,
                  child: Text(
                    'Level Up',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              right: 8.0,
            ),
            child: Container(
              height: 40,
              width: 130,
              child: ElevatedButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(
                      Colors.lightGreen.shade100),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lightGreen),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
                onPressed: () {
                  print("You pressed the Evolve Button!");
                },
                child: Container(
                  width: 70,
                  alignment: Alignment.center,
                  child: Text(
                    'Evolve',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
