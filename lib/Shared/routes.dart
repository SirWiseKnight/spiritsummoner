import 'package:spirit_summoner/Services/login_home.dart';
import 'package:spirit_summoner/Services/welcome.dart';
import 'package:spirit_summoner/Home/home.dart';
import 'package:spirit_summoner/Quest/questHub.dart';
import 'package:spirit_summoner/Battle/battleHub.dart';
import 'package:spirit_summoner/Shop/shopHub.dart';
import 'package:spirit_summoner/Chat/chatHub.dart';

var appRoutes = {
  '/': (context) => const LoginHomeScreen(),
  '/welcome': (context) => const WelcomeScreen(),
  '/home': (context) => const HomeScreen(),
  '/quest': (context) => const QuestScreen(),
  '/battle': (context) => const BattleScreen(),
  '/shop': (context) => const ShopScreen(),
  '/chat': (context) => const ChatScreen(),
};
