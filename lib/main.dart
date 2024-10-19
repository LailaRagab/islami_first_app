import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/ui/screens/home_screen/home.dart';
import 'package:islami_app/ui/screens/splash_screen/splash.dart';
import 'package:islami_app/ui/screens/suras_details/suras_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/utils/providers/language_provider.dart';
import 'package:islami_app/utils/themeProvider/theme_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp( ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
        child: IslamiApp()),
  )
  );
}

class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LanguageProvider langProvider = Provider.of(context) ;
    ThemeProvider themeProvider = Provider.of(context) ;
    return MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData(),
      themeMode:  themeProvider.currentTheme,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
      Locale("en"),
      Locale("ar"),],
      locale: Locale(langProvider.selectedLang),
      debugShowCheckedModeBanner: false,
      routes: {
        Splash.routeName: (_) => const Splash(),
        Home.routeName: (_) => const Home() ,
        SurasDetails.routeName : (_) => const SurasDetails()
      },
      initialRoute: Splash.routeName,
    );
  }
}
