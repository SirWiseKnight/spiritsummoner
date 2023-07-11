import 'package:flutter/material.dart';
import 'package:spirit_summoner/Shared/Animations/spiritBounce.dart';

class PartnerImageWIP extends StatelessWidget {
  const PartnerImageWIP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        child: BouncingImage(imageUrl: 'assets/Spirits/1_tottoc.png'),
      ),
    );
  }
}
