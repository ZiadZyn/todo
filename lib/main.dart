import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/home_screen.dart';
import 'package:todo/my_theme.dart';
import 'package:todo/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context)=>AppConfigProvider(),
      child: MyApp(),
  ));
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
      },
      themeMode: provider.appTheme,
      theme: MyTheme.lightMode,
      darkTheme: MyTheme.darkMode,
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
