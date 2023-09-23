import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class quranAppBar extends StatelessWidget {
  const quranAppBar({super.key,required this.string});
  final String string;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: (){
        }, icon:const Icon(FontAwesomeIcons.house,color: Colors.grey,))
        ,const Spacer(),
         Directionality(textDirection: TextDirection.rtl, 
        child: Text(string,style:const TextStyle(
          fontFamily:'quran',
          fontSize: 30,
          fontWeight: FontWeight.w900
        ) ,)),
        const Spacer(),
        IconButton(onPressed: (){
        }, icon:const Icon(Icons.search,color: Colors.grey,))
      ],
    );
  }
}