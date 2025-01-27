/// External Files
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spirit_summoner/config/interface/colors/themes.dart';

/// Project Files
import 'package:spirit_summoner/domain/navigation/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(
              child: Text("ERROR 404", textDirection: TextDirection.ltr));
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            initialRoute: '/welcome',
            routes: appRoutes,
            theme: appTheme,
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(
            child: Text("Loading...", textDirection: TextDirection.ltr));
      },
    );
  }
}
