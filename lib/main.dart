import 'package:flutter/material.dart';
import 'package:user_preferences/pages/home_page.dart';
import 'package:user_preferences/pages/settings_page.dart';
import 'package:user_preferences/shared/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences().initPref();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = Preferences();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User preferences',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        SettingsPage.routeName: (_) => SettingsPage(),
      },
      theme: prefs.modoOscuro ? ThemeData.dark() : ThemeData.light(),
    );
  }
}
