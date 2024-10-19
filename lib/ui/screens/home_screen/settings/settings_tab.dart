import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/utils/appColors.dart';
import 'package:islami_app/utils/appStyles.dart';
import 'package:islami_app/utils/extension.dart';
import 'package:islami_app/utils/providers/language_provider.dart';
import 'package:islami_app/utils/themeProvider/theme_provider.dart';
import 'package:provider/provider.dart';


class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  late LanguageProvider langProvider ;
  late ThemeProvider themeProvider ;
  @override
  Widget build(BuildContext context) {
    langProvider = Provider.of(context);
    themeProvider = Provider.of(context) ;
    return Padding(
      padding: const EdgeInsets.all(70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(context.appLocalizations.language , style: AppStyles.semibold),
          buildAppLanguage(),
          SizedBox(height: 50),
          Row(
            children: [
              Text(context.appLocalizations.theme, style: AppStyles.semibold),
              SizedBox(width: 113,),
              buildAppTheme(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildAppLanguage() {
    return DropdownButton(
        value: langProvider.selectedLang,
        items: [
          DropdownMenuItem(child: Text("English"), value: "en"),
          DropdownMenuItem(child: Text("العربيه"), value: "ar")
        ],
        isExpanded: true,
        onChanged: (newValue) {
           langProvider.newLanguage = newValue ?? langProvider.selectedLang ;
          setState(() {});
        });
  }

 Widget buildAppTheme() {
    return Switch(
      activeColor: AppColors.primary,
        value: themeProvider.isDarkActive ,
        onChanged: (newValue){
          themeProvider.newTheme = newValue ? ThemeMode.dark : ThemeMode.light ;
        }) ;
  }
}