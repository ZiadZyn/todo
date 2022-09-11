import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class ThemingBottomSheet extends StatefulWidget {

  @override
  State<ThemingBottomSheet> createState() => _ThemingBottomSheetState();
}

class _ThemingBottomSheetState extends State<ThemingBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<AppConfigProvider>(context);
    return Container(
      child: Column(
        children: [
          InkWell(
              onTap: (){
                provider.ChangeTheme(ThemeMode.dark);
              },
              child: provider.appTheme==ThemeMode.dark?
              getSelctedLanguage(AppLocalizations.of(context)!.dark_mode):
              getUnSelctedLanguage(AppLocalizations.of(context)!.dark_mode)
          ),
          SizedBox(height: 20,),
          InkWell(
              onTap: (){
                provider.ChangeTheme(ThemeMode.light);
              },
              child: provider.appTheme==ThemeMode.light?
              getSelctedLanguage(AppLocalizations.of(context)!.light_mode):
              getUnSelctedLanguage(AppLocalizations.of(context)!.light_mode)
          ),
        ],
      ),
    );
  }

  Widget getSelctedLanguage(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: Theme.of(context).textTheme.subtitle1,),
        Icon(Icons.check, color: Colors.green,)
      ],
    );
  }
  Widget getUnSelctedLanguage(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: Theme.of(context).textTheme.subtitle1,),
      ],
    );
  }
}
