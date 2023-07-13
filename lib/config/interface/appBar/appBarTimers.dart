import 'package:flutter/material.dart';

class HomeTimers extends StatelessWidget {
  const HomeTimers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
      child: Row(children: [
        Container(
          child: CircularProgressIndicator(
            value: 0.66,
            color: Colors.orange,
            backgroundColor: Colors.grey,
            strokeWidth: 6.0,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          child: CircularProgressIndicator(
            value: 0.66,
            color: Colors.greenAccent,
            backgroundColor: Colors.grey,
            strokeWidth: 6.0,
          ),
        ),
      ]),
    );
  }
}
