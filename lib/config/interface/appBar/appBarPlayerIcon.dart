import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spirit_summoner/pages/profiles/view/playerProfile.dart';

class PlayerIcon extends StatelessWidget {
  const PlayerIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.height * 0.09,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 103, 0),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.height * 0.09,
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          },
          icon: Icon(
            FontAwesomeIcons.idCardClip,
            color: Colors.white,
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
