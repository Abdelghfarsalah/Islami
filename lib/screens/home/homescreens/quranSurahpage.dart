import 'package:flutter/material.dart';
import 'package:islam/models/surahmodel.dart';
import 'package:islam/screens/home/homescreens/quran.dart';
import 'package:quran/quran.dart' as q;

class surahPage extends StatelessWidget {
  const surahPage({super.key, required this.model});
  final Surah model;
  @override
  Widget build(BuildContext context) {
    int count = model.versesCount;
    int index = model.id;
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        Directionality(
            textDirection: TextDirection.rtl,
            child: Expanded(
              child: ListView(
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                'assets/images/quran/snapedit_1695493155206.jpg'))),
                    child: Center(
                      child: Text(
                        model.arabicName,
                        style: const TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 22),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child:model.arabicName!='التوبة'?const  Text(
                      q.basmala,
                      style: TextStyle(
                          fontFamily: 'quran',
                          fontWeight: FontWeight.w900,
                          fontSize: 30),
                    ):Text(''),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: RichText(
                        textAlign:
                            count <= 20 ? TextAlign.center : TextAlign.justify,
                        text: TextSpan(children: [
                          for (int i = 1; i <= count; i++) ...{
                            TextSpan(
                                text: '  ' +
                                    q.getVerse(
                                      index,
                                      i,
                                    ) +
                                    '  ',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'quran',
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black)),
                            WidgetSpan(
                                child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/quran/png-transparent-ayah-surah-quran-filename-the-qur-an-miscellaneous-leaf-text-removebg-preview.png'))),
                              child: Center(
                                  child: Text(
                                '$i',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w900),
                              )),
                            ))
                          }
                        ])),
                  ),
                ],
              ),
            ))
      ])),
    );
  }
}
