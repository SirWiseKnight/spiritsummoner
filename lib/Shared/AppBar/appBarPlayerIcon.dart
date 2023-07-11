import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spirit_summoner/Profiles/playerProfile.dart';

class PlayerIcon extends StatelessWidget {
  const PlayerIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepPurpleAccent,
            Colors.deepPurple,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Container(
        width: 72,
        height: 72,
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          },
          icon: Icon(
            FontAwesomeIcons.idCardClip,
            size: 28,
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
          ),
        ),
      ),
    );
  }
}
