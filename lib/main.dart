import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_news_app/screens/splash_screen.dart';
import 'package:flutter_news_app/utils/themes.dart';
import 'package:flutter_news_app/view_model/data_viewmodel.dart';
import 'package:flutter_news_app/view_model/theme_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ChangeNotifierProvider(create: (context) => DataProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ThemeProvider>();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Khabar',
        themeMode: provider.dark ? ThemeMode.dark : ThemeMode.light,
        theme: MyThemes.lightTheme(context),
        darkTheme: MyThemes.darkTheme(context),
        home: const SplashScreen());
  }
}
