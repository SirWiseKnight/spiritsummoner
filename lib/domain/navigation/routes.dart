import 'package:spirit_summoner/pages/battle/view/spiritSummaryPage.dart';
import 'package:spirit_summoner/pages/login/login_home.dart';
import 'package:spirit_summoner/pages/splash/welcome.dart';
import 'package:spirit_summoner/pages/battle/view/battleHub.dart';
import 'package:spirit_summoner/pages/chat/view/chatHub.dart';
import 'package:spirit_summoner/pages/home/view/homeHub.dart';
import 'package:spirit_summoner/pages/quest/view/questHub.dart';
import 'package:spirit_summoner/pages/shop/view/shopHub.dart';

var appRoutes = {
  '/': (context) => const LoginHomeScreen(),
  '/welcome': (context) => const WelcomeScreen(),
  '/home': (context) => const HomeScreen(),
  '/quest': (context) => const QuestScreen(),
  '/battle': (context) => BattleScreen(),
  '/shop': (context) => const ShopScreen(),
  '/chat': (context) => ChatScreen(),
  '/spirit_summary_page': (context) => SpiritSummaryScreen(),
};
