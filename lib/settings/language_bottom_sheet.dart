import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<AppConfigProvider>(context);
    return Container(
      child: Column(
        children: [
          InkWell(
              onTap: (){
                provider.ChangeLanguage('en');
              },
              child: provider.appLanguage=='en'?
              getSelctedLanguage(AppLocalizations.of(context)!.english):
              getUnSelctedLanguage(AppLocalizations.of(context)!.english)
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              provider.ChangeLanguage('ar');
            },
            child: provider.appLanguage=='ar'?
            getSelctedLanguage(AppLocalizations.of(context)!.arabic):
            getUnSelctedLanguage(AppLocalizations.of(context)!.arabic),
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

