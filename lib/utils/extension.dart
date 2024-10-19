import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension contextExtention on BuildContext{
  AppLocalizations get appLocalizations  =>
    AppLocalizations.of(this)! ;

}