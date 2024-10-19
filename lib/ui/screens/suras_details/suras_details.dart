import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/sura_details_args.dart';
import 'package:islami_app/utils/appColors.dart';
import 'package:islami_app/utils/assets.dart';
import '../../widgets/appBar.dart';

class SurasDetails extends StatefulWidget {
  const SurasDetails({super.key});

  @override
  State<SurasDetails> createState() => _SurasDetailsState();
  static const String routeName = "SuraDetails";
}

class _SurasDetailsState extends State<SurasDetails> {
  static String suraContent = "" ;

  @override
  Widget build(BuildContext context) {
   SuraDetailsArgs args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
   loadFileContent (args.fileName);

   return Container(
     decoration: BoxDecoration(
       image: DecorationImage(image: AssetImage(AssetsApp.defaultbg))
     ) ,
   child:Scaffold(appBar:buildAppBar(context) ,
     backgroundColor: Colors.transparent,
     body: Center(
       child: Container(child: SingleChildScrollView(child: buildLoader()) ,
       width: 354,
       height: 652,
       decoration: BoxDecoration(borderRadius: BorderRadius.circular(20) ,
           color: Color(0XFFF8F8F8) ),),
     ) ,
    ),
    ) ;
  }

  Center buildLoader() => Center(child: suraContent.isEmpty ? CircularProgressIndicator() : Text(suraContent));

  void loadFileContent (String fileName) async{
    suraContent = await rootBundle.loadString("lib/assets/files/$fileName");
    List<String> lines = suraContent.split('\n');
    String numberedContent = '';
    for (int i = 0; i < lines.length; i++) {
      numberedContent += ' ${lines[i].trim()} { ${i + 1} }';
      if(lines[i].trim().isEmpty){
        break;
      }
    }
    setState(() {
      suraContent = numberedContent;
    });

  }
}
