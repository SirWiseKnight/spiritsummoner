import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gradient_borders/gradient_borders.dart';

class QuestList extends StatelessWidget {
  const QuestList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('quest')
          //.where("parent", isEqualTo: "desertcavern")
          .orderBy('order')
          .get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text('No quests found.'),
          );
        }
        return Container(
          height: MediaQuery.of(context).size.height * 0.35,
          child: ListView(
            shrinkWrap: false,
            padding: EdgeInsets.only(top: 8.0),
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              String questName = data['name'] ?? '';
              String questGold = data['gold'] ?? '';
              String questEXP = data['exp'] ?? '';
              String questType = data['type'] ?? '';
              String questStamina = data['energy'] ?? '';
              String questProgress = data['progress'] ?? '';
              int questProgressTotal =
                  (double.parse(questProgress) * 100).round();
              return Padding(
                padding: const EdgeInsets.only(
                  right: 4.0,
                  bottom: 4.0,
                  top: 8.0,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.23),
                    border: GradientBoxBorder(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.white.withOpacity(0.4),
                          Colors.white.withOpacity(0.01),
                          Colors.white.withOpacity(0.1),
                        ],
                      ),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 72,
                        height: 52,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 12.0,
                            right: 8.0,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                child: CircularProgressIndicator(
                                  value: double.parse(questProgress),
                                  backgroundColor:
                                      Colors.white.withOpacity(0.23),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color.fromARGB(255, 50, 215, 75)
                                        .withOpacity(0.75),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  questProgressTotal.toString() + '%',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                questName,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Color.fromARGB(255, 113, 172, 255)
                                        .withOpacity(0.75),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      questEXP + ' EXP',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.yellow.shade800
                                        .withOpacity(0.75),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      questGold + ' Gold',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 50, 215, 75)
                                      .withOpacity(0.75),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                final snackBar = SnackBar(
                                  content: Text('You gained ' +
                                      questEXP +
                                      ' EXP and ' +
                                      questGold +
                                      ' gold!'),
                                  action: SnackBarAction(
                                    label: 'Close',
                                    onPressed: () {
                                      // Some code to undo the change.
                                    },
                                  ),
                                );

                                // Find the ScaffoldMessenger in the widget tree
                                // and use it to show a SnackBar.
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 4.0),
                                      child: Text(
                                        questType,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    Text(
                                      'EN: ' + questStamina,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white.withOpacity(0.75),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
