import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/provider.dart';
import 'package:todo/settings/settings.dart';
import 'package:todo/tasks_tap/task_tap.dart';

import 'tasks_tap/add_task_bottom_sheet.dart';
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
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: Theme(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showAddTaskBottomSheet(provider);
        },
        child: Icon(Icons.add),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[currentIndex],
    );
  }
  var tabs=[TaskTap(),Sittengs()];

  void showAddTaskBottomSheet(provider) {
     showModalBottomSheet(
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(20.0),
         ),
        context: context,
        builder: (context) {
         return AddTaskBottomSheet();
        });
  }
}
