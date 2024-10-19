import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home_screen/ahadeth/ahadethTap.dart';
import 'package:islami_app/ui/screens/home_screen/quran/quranTab.dart';
import 'package:islami_app/ui/screens/home_screen/radio/radioTab.dart';
import 'package:islami_app/ui/screens/home_screen/sebha/sebhaTab.dart';
import 'package:islami_app/ui/screens/home_screen/settings/settings_tab.dart';
import 'package:islami_app/utils/appColors.dart';
import 'package:islami_app/utils/assets.dart';

import '../../widgets/appBar.dart';

class Home extends StatefulWidget {
  static String routeName = "home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
int currentIndex = 0 ;
List<Widget> tabs = [Quran(), Ahadeth() , Sebha() , RadioTab() , SettingsTab()] ;
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration:BoxDecoration(
        image: DecorationImage(image: AssetImage(AssetsApp.defaultbg))
      ) ,
      child :Scaffold(
      backgroundColor: AppColors.transparent,
      appBar: buildAppBar(context),
      bottomNavigationBar: buildBottomNavBar(),
        body: tabs[currentIndex],
      ));
  }

  Widget buildBottomNavBar() {
    return Theme(
        data: ThemeData(canvasColor: AppColors.primary),
        child: BottomNavigationBar(
            onTap: (index){
              currentIndex = index ;
              setState(() {});
            },
            currentIndex: currentIndex,
            selectedItemColor: AppColors.accent,
            items: [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AssetsApp.iconQuran)), label: "quran"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AssetsApp.iconHadeth)), label: "hadeth"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AssetsApp.iconSebha)), label: "sebha"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AssetsApp.iconRadio)), label: "radio"),
          BottomNavigationBarItem(
                  icon: Icon(Icons.settings) , label: "settings"),
        ]));
  }
}
