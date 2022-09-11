import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/firebase_utils/firebase_utils.dart';
import 'package:todo/model/task.dart';
import 'package:todo/provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/utils/utils.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  String title='';

  String description='';

  DateTime selectedDate=DateTime.now();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.add_new_task,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  validator: (text){
                    if(text == null||text.isEmpty){return AppLocalizations.of(context)!.add_new_task;}
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.enter_your_task,
                    labelStyle: TextStyle(fontSize: 14),
                  ),
                  onChanged: (text){
                    title=text;
                    setState(() {

                    });
                    },
                ),
                TextFormField(
                  maxLines: 10,
                  minLines: 2,
                  validator: (text){
                    if(text == null||text.isEmpty){return AppLocalizations.of(context)!.enter_your_description;}
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText:
                        AppLocalizations.of(context)!.enter_your_description,
                    labelStyle: TextStyle(fontSize: 14),
                  ),
                  onChanged: (text){
                    description=text;
                    setState(() {

                    });
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  AppLocalizations.of(context)!.select_time,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: (){chooseDate();},
                  child: Text(
                    '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(60,60),
                        shape: const CircleBorder()),
                    onPressed: (){addTask();},
                    child: Icon(Icons.check,size: 40,))
              ],
            ),
          ),
        ],
      ),
    );
  }
  void chooseDate()async{
    var chooseDate=await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 3650)));
    if(chooseDate!=null){
      selectedDate=chooseDate;
      setState(() {

      });
    }
  }

  addTask() {
    if(formKey.currentState!.validate()){
      Task task=Task(
          title: title,
          description: description,
          date: selectedDate.millisecondsSinceEpoch
      );
      //showLoading(context, 'Loading...',false);
      addTaskToFirebase(task).timeout(Duration(milliseconds: 5000),onTimeout: (){});
      showMessage(context, AppLocalizations.of(context)!.add_new_task, AppLocalizations.of(context)!.done, (){
        Navigator.pop(context);
        Navigator.pop(context);
      });
      //hideLoading(context);

    }
  }
}
