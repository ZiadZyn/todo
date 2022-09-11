import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/my_theme.dart';
import 'package:todo/provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/tasks_tap/edit_task_bottom_sheet.dart';
import 'package:todo/utils/utils.dart';
import '../firebase_utils/firebase_utils.dart';
import '../model/task.dart';

class TaskItem extends StatefulWidget {
  Task task;
  TaskItem({required this.task});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.25,
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // All actions are defined in the children parameter.
        children: [
          SlidableAction(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
            onPressed: (context) {
              deleteTaskFromFireStore(widget.task)
                  .timeout(Duration(milliseconds: 500), onTimeout: () {
                provider.getTaskFromFireStore();
                showMessage(context, AppLocalizations.of(context)!.done, 'ok',
                    () {
                  Navigator.pop(context);
                });
              });
            },
            backgroundColor: MyTheme.lightRed,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: AppLocalizations.of(context)!.delete,
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.all(18),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: provider.BackgroundContainer(),
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: () {
            showEditTaskBottomSheet(widget.task);
          },
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 7, left: 7),
                height: 60,
                width: 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: widget.task.isDone
                      ? MyTheme.lightGreen
                      : MyTheme.lightBlue,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.task.title,
                      style: widget.task.isDone
                          ? Theme.of(context).textTheme.headline5
                          : Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(widget.task.description,
                        style: widget.task.isDone
                            ? Theme.of(context).textTheme.headline5
                            : TextStyle(color: provider.ClockColor())),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  editIsDone();
                  // widget.task.isDone=true;
                },
                child: widget.task.isDone
                    ? Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: MyTheme.white,
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.done,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: MyTheme.lightBlue,
                        ),
                        child: Icon(
                          Icons.check,
                          size: 30,
                          color: MyTheme.white,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void editIsDone() {
    var taskRef = getTaskCollection();
    taskRef.doc(widget.task.id).update({'isDone': true});
    print('the task id is ${widget.task.id}');
  }

  void showEditTaskBottomSheet(Task task) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (context) {
          return EditTaskBottomSheet(task: task,);
        });
  }
}
