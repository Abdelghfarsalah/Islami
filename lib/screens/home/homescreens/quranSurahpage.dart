import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:islam/models/surahmodel.dart';
import 'package:islam/screens/home/homescreens/quran.dart';
import 'package:quran/quran.dart' as q;

class surahPage extends StatefulWidget {
  const surahPage({super.key, required this.model});
  final Surah model;

  @override
  State<surahPage> createState() => _surahPageState();
}

class _surahPageState extends State<surahPage> {
  bool valu = true;

  @override
  Widget build(BuildContext context) {
    int count = widget.model.versesCount;
    int index = widget.model.id;
    return Scaffold(
        
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:const Icon(FontAwesomeIcons.arrowLeft,color: Colors.grey,)),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          FlutterSwitch(
              activeColor: Colors.greenAccent,
              value: valu,
              onToggle: (value) {
                setState(() {
                  valu = !valu;
                });
              }),
            const  SizedBox(
                width: 20,
              ),
        const  Text('الرسم العثماني',  style:  TextStyle(
          color: Colors.black,
                            fontWeight: FontWeight.w900, fontSize: 22),)
        ]),
      ),
      body: SafeArea(
          child: Column(children: [
        Directionality(
            textDirection: TextDirection.rtl,
            child: Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
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
                        widget.model.arabicName,
                        style: const TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 22),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: widget.model.arabicName != 'التوبة'
                        ? const Text(
                            q.basmala,
                            style: TextStyle(
                                fontFamily: 'quran',
                                fontWeight: FontWeight.w900,
                                fontSize: 30),
                          )
                        : Text(''),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: RichText(
                        textAlign:
                            count <= 20||!valu ? TextAlign.center : TextAlign.justify,
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
                            )),
                            !valu ?const TextSpan(text: '\n') :const TextSpan(),
                            !valu ?const TextSpan(children: [
                              TextSpan(text: '- - - - - - - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\n',style: TextStyle(
                                color: Colors.grey
                              ))
                            ]) :const TextSpan(),
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
