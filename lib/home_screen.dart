import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider.dart';
import 'package:todo/settings.dart';
import 'package:todo/task_tap.dart';

import 'my_theme.dart';

class HomeScreen extends StatefulWidget {
static String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int currentIndex =0;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Scaffold(
      backgroundColor: provider.BacgroundTheme(),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.todolist,style: Theme.of(context).textTheme.headline4,),
      ),
      bottomNavigationBar: Theme(
    data: Theme.of(context).copyWith(
    canvasColor: MyTheme.lightBlue
    ),
        child: Theme(
        data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
    child: BottomNavigationBar(
    currentIndex: currentIndex,
    onTap: (index){
    currentIndex = index;
    setState(() {

    });
    },
    items: [
      BottomNavigationBarItem(
        label: AppLocalizations.of(context)!.tasks,
        icon: Icon(Icons.list),
      ),
      BottomNavigationBarItem(
        label: AppLocalizations.of(context)!.settings,
        icon: Icon(Icons.settings),
      ),
    ],
      ),
    )
      ),
        body: tabs[currentIndex],
    );
  }
  var tabs=[TaskTap(),Sittengs()];
}
