import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/provider.dart';
import 'package:todo/settings/themeing_bottom_sheet.dart';

import '../my_theme.dart';
import 'language_bottom_sheet.dart';

class Sittengs extends StatefulWidget {

  @override
  State<Sittengs> createState() => _SittengsState();
}

class _SittengsState extends State<Sittengs> {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.language,style: Theme.of(context).textTheme.subtitle1,),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){ShowLanguageBottomSheet(provider);},
              child: Container(
                decoration: BoxDecoration(
                  color: (provider.appTheme==ThemeMode.light)?MyTheme.white:MyTheme.black,
                  border: Border.all(color: MyTheme.lightBlue),
                ),
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(provider.appLanguage=='en'?AppLocalizations.of(context)!.english:AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.subtitle2,),
                    Icon(Icons.arrow_drop_down_sharp,)
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text(AppLocalizations.of(context)!.mode,style: Theme.of(context).textTheme.subtitle1,),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){ShowThemingBottomSheet(provider);},
              child: Container(
                decoration: BoxDecoration(
                  color: (provider.appTheme==ThemeMode.light)?MyTheme.white:MyTheme.black,
                  border: Border.all(color: MyTheme.lightBlue),
                ),
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(provider.appTheme==ThemeMode.dark?AppLocalizations.of(context)!.dark_mode:AppLocalizations.of(context)!.light_mode,style: Theme.of(context).textTheme.subtitle2,),
                    Icon(Icons.arrow_drop_down_sharp,)
                  ],
                ),
              ),
            ),

          ]
      ),
    );
  }

  void ShowLanguageBottomSheet(var provider) {

    showModalBottomSheet(
      backgroundColor: (provider.appTheme==ThemeMode.light)? MyTheme.white:MyTheme.black,
        context: context,
        builder: (context){
          return LanguageBottomSheet();
        }
    );
  }
  void ShowThemingBottomSheet(var provider) {

    showModalBottomSheet(
      backgroundColor: (provider.appTheme==ThemeMode.light)? MyTheme.white:MyTheme.black,
        context: context,
        builder: (context){
          return ThemingBottomSheet();
        }
    );
  }
}

