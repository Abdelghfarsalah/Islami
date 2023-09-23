import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islam/main.dart';
import 'package:islam/screens/home/widgets/customSurah.dart';
import 'package:islam/screens/home/widgets/quranAppbar.dart';

class quran extends StatefulWidget {
  const quran({super.key});

  @override
  State<quran> createState() => _quranState();
}

class _quranState extends State<quran> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          quranAppBar(string: 'القران الكريم',),
          const SizedBox(
            height: 10,
          ),
          CarouselSlider(
              items: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                'assets/images/quran/content_shutterstock_1211223958.jpg'))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                'assets/images/quran/pngtree-al-quran-opened-read-photography-image_604727.jpg'))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                'assets/images/quran/timthumb.jpeg'))),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.25,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayCurve: Curves.easeIn,
              )),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text('القران الكريم كامل',
                  style: TextStyle(
                      fontFamily: 'quran',
                      fontSize: 30,
                      fontWeight: FontWeight.w900)),
            ),
          ),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => customsurah(
                      model: listsurah[index],
                    ),
                separatorBuilder: (context, index) => const Divider(
                      thickness: 1,
                      height: 1,
                      endIndent: 20,
                      indent: 20,
                    ),
                itemCount: listsurah.length),
          ),
        ],
      ),
    );
  }
}
