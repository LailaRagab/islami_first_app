import 'package:flutter/material.dart';
import 'package:islami_app/utils/appColors.dart';
import 'package:islami_app/utils/appStyles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AppBar buildAppBar(BuildContext context){
  return AppBar(
    title: Text(
        AppLocalizations.of(context)!.islami,
    style: AppStyles.appBarText),
    backgroundColor: AppColors.transparent,
    centerTitle: true
  );
}
