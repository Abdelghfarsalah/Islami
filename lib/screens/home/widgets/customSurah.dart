import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:islam/models/surahmodel.dart';
import 'package:islam/screens/home/homescreens/quranSurahpage.dart';
import 'package:islam/utils/functions.dart';

class customsurah extends StatelessWidget {
  const customsurah({super.key, required this.model});
  final Surah model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GestureDetector(
        onTap: () {
          go(context, surahPage(model: model));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'assets/images/quran/png-clipart-quran-islam-tafsir-ayah-dua-golden-atmosphere-badge-round-yellow-floral-rectangle-arabic-removebg-preview.png'))),
              child: Center(
                  child: Text('${model.id}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w900))),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.arabicName,
                    style: const TextStyle(
                        fontFamily: 'NotoKufiArabic',
                        fontSize: 30,
                        fontWeight: FontWeight.w400)),
                Row(
                  children: [
                    Text('${model.revelationPlace}  ',
                        style:
                            const TextStyle(fontSize: 15, color: Colors.grey)),
                    Text('${model.versesCount} VERSES',
                        style:
                            const TextStyle(fontSize: 15, color: Colors.grey)),
                  ],
                )
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.play),
            ),
          ],
        ),
      ),
    );
  }
}
