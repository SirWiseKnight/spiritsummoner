import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PartnerLevel extends StatelessWidget {
  const PartnerLevel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 44,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Level",
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
            Text(
              "1",
              style: GoogleFonts.poppins(
                fontSize: 20,
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
          ],
        ),
      ),
    );
  }
}
