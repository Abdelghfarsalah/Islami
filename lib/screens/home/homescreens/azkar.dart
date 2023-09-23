
import 'package:flutter/material.dart';
import 'package:islam/models/azkarmodel.dart';
import 'package:islam/screens/home/homescreens/quran.dart';
import 'package:islam/screens/home/widgets/azkarbox.dart';
import 'package:islam/screens/home/widgets/quranAppbar.dart';
import 'package:quran/quran.dart' as quran;


class azkar extends StatefulWidget {
  const azkar({super.key});

  @override
  State<azkar> createState() => _azkarState();
}

class _azkarState extends State<azkar> {
  List<azkarmodel> list=[
  azkarmodel(image: 'assets/images/Azkar/Duhar.jpg', name: 'اذكار الصباح', index: 0),
  azkarmodel(image: 'assets/images/Azkar/maghrab.jpg', name: 'اذكار المساء', index: 1),
  azkarmodel(image: 'assets/images/Azkar/alfagr.jpg', name: 'اذكار قيام الليل', index: 2),
  azkarmodel(image: 'assets/images/Azkar/9867c68ba93843934744464e294a6cc878d7c819.png', name: 'اذكار الصلاه', index: 3),
  ];
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
        const  quranAppBar(string: 'الاذكار',),
        const  SizedBox(
            height: 20,
          ),
          azkarbox(text: list[0],l: 0,),
          azkarbox(text: list[1],l: 1,),
          azkarbox(text: list[2],l: 2,),
          azkarbox(text: list[3],l: 3,),
        ],
      ),
    );
  }
}


