import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
   String selectedLang = "en" ;

   set newLanguage(String newLanguage){
      selectedLang = newLanguage;
      notifyListeners();
   }
}