import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PartnerHealthBar extends StatelessWidget {
  const PartnerHealthBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 200,
        child: Center(
          child: Text(
            "100" + " HP",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              shadows: <Shadow>[
                Shadow(
                  color: Colors.black.withOpacity(0.7),
                  blurRadius: 1.0,
                  offset: Offset(
                    1,
                    1,
                  ),
                )
              ],
              color: Colors.white,
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromARGB(255, 48, 219, 91).withOpacity(0.8),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black54,
              blurRadius: 0.1,
              spreadRadius: 0.5,
              offset: Offset(0.5, 0.75),
            )
          ],
        ),
      ),
    );
  }
}
