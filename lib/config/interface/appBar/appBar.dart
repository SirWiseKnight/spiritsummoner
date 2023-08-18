import 'package:flutter/material.dart';
import 'package:spirit_summoner/config/interface/appBar/appBarBarrel.dart';

class AppBarPane extends StatelessWidget {
  const AppBarPane({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.175,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 171, 218, 42),
            Color.fromARGB(255, 171, 218, 42),
            Color.fromARGB(255, 145, 190, 22),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PlayerIcon(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PlayerInfo(),
                        PlayerEXP(),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
