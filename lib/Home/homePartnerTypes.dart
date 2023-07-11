import 'package:flutter/material.dart';

class PartnerTypes extends StatelessWidget {
  const PartnerTypes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 44,
        width: 44,
        child: Image.asset('assets/Icons/typeDark.png'),
      ),
    );
  }
}
