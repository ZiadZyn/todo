import 'package:flutter/material.dart';
import 'package:todo/my_theme.dart';

class AppConfigProvider extends ChangeNotifier{
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;

  void ChangeLanguage(String newLanguage){
    if(appLanguage==newLanguage){return;}
    appLanguage=newLanguage;
    notifyListeners();
  }

  void ChangeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    notifyListeners();
  }

    Color BacgroundTheme(){
      if(ThemeMode.light==appTheme){
        return MyTheme.primaryGray;
        notifyListeners();
      }else{
        return MyTheme.black;
        notifyListeners();
      }

    }}