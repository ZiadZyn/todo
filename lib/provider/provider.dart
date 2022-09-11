import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/my_theme.dart';

import '../firebase_utils/firebase_utils.dart';
import '../model/task.dart';

class AppConfigProvider extends ChangeNotifier{
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;
  List<Task> taskList=[];
  DateTime selectedDay=DateTime.now();

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

    }

  Color BackgroundContainer(){
    if(ThemeMode.light==appTheme){
      return MyTheme.white;
      notifyListeners();
    }else{
      return MyTheme.black;
      notifyListeners();
    }

  }

  Color ClockColor(){
    if(ThemeMode.light==appTheme){
      return MyTheme.black;
      notifyListeners();
    }else{
      return MyTheme.white;
      notifyListeners();
    }

  }

  getTaskFromFireStore() async{
    QuerySnapshot<Task> querySnapshot = await getTaskCollection().get();
    taskList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    taskList=taskList.where((task){
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(task.date);
      if(dateTime.year == selectedDay.year && dateTime.month==selectedDay.month && dateTime.day==selectedDay.day){
        return true;
      }
      return false;
    }).toList();

    taskList.sort((Task task1,Task task2){
      DateTime dateTime1=DateTime.fromMillisecondsSinceEpoch(task1.date);
      DateTime dateTime2=DateTime.fromMillisecondsSinceEpoch(task2.date);
      return dateTime1.compareTo(dateTime2);
    });

    notifyListeners();
  }

  changeSelectedDay(DateTime newDate){
    selectedDay=newDate;
    notifyListeners();
  }


}