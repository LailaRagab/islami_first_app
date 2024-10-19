import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/model/sura_details_args.dart';
import 'package:islami_app/ui/screens/suras_details/suras_details.dart';
import 'package:islami_app/utils/appColors.dart';
import 'package:islami_app/utils/appConstants.dart';
import 'package:islami_app/utils/appStyles.dart';
import 'package:islami_app/utils/assets.dart';
import 'package:islami_app/utils/extension.dart';


class Quran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildTopLogo(),
          buildVertificalDivider(context),

        ],
      ),
    );
  }

  Widget buildTopLogo(){
    return Expanded(child:
    Image.asset(AssetsApp.quranScreenLogo) ,
    flex: 3,
    ) ;
  }


  Widget buildDivider(){
    return Divider(
      height: 2,
      thickness: 2,
      color: AppColors.primary,
    );
  }

  Widget buildQuranTitles(BuildContext context){
    return Row(
      children: [
        Expanded(child:
        Text( context.appLocalizations.sura ,
            textAlign: TextAlign.center  , style: AppStyles.semibold
    )),
        Expanded(child:
        Text( textAlign: TextAlign.center ,
            context.appLocalizations.verses , style: AppStyles.semibold
        ),),
      ],
    );
  }

  Widget buildVertificalDivider(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Stack(
        alignment: Alignment.center,
      children: [
        Column( children: [
        buildDivider(),
        buildQuranTitles(context),
        buildDivider(),
        buildSuraNamesAndVersesNumber(),
      ],),
        VerticalDivider(
          color: AppColors.primary,
          thickness: 2,
        ),
    ],
      ),
    );
  }
  
  Expanded buildSuraNamesAndVersesNumber()=>
     Expanded( child:
         ListView.builder(
      itemCount: Constants.ArSuras.length,
      itemBuilder:(Context , index){
      return InkWell(child:
        Row(
        children: [
          Expanded(child:
          Text( Constants.ArSuras [index], textAlign: TextAlign.center ,
              style: AppStyles.regular)),
          Expanded(child:
          Text( Constants.Verses[index].toString(), textAlign: TextAlign.center  ,
              style: AppStyles.regular)),
        ],
      ),
        onTap: (){
        Navigator.pushNamed(Context , SurasDetails.routeName ,arguments:
        SuraDetailsArgs(suraName: Constants.ArSuras[index], fileName: '${index+1}.txt') );
        },
      );
    }),
     );

}
