import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase_utils/firebase_utils.dart';
import 'package:todo/tasks_tap/task_item.dart';
import '../model/task.dart';
import '../my_theme.dart';
import 'package:todo/provider/provider.dart';
import 'package:provider/provider.dart';

class TaskTap extends StatefulWidget {

  @override
  State<TaskTap> createState() => _TaskTapState();
}

class _TaskTapState extends State<TaskTap> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);

      provider.getTaskFromFireStore();
    
    return Column(
      children: [
        CalendarTimeline(
          initialDate: provider.selectedDay,
          firstDate: DateTime.now().subtract(Duration(days: 3650)),
          lastDate: DateTime.now().add(Duration(days: 3650)),
          onDateSelected: (date)  {
            if(date != null){
            provider.changeSelectedDay(date);
            }
          },
          leftMargin: 20,
          monthColor: MyTheme.lightBlue,
          dayColor: MyTheme.lightBlue,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: MyTheme.lightBlue,
          dotsColor: Color(0xFF333A47),
          locale: 'en_ISO',
        ),
        Expanded(
          child: ListView.builder(
              itemBuilder: (context,index){return TaskItem(task: provider.taskList[index],);},
              itemCount: provider.taskList.length,
          ),
        ),
      ],
    );
  }

}
