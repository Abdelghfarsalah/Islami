import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islam/main.dart';
import 'package:islam/screens/home/widgets/customSurah.dart';
import 'package:islam/screens/home/widgets/customtextfiled.dart';
import 'package:islam/utils/functions.dart';
import 'package:lottie/lottie.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  String index = '';
  int k = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
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
            customtextfiled(
              onChanged: (p0) {
                setState(() {
                  index = p0;
                  k = findsurah(text: index);
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            k == -1
                ? Center(
                    child: Lottie.asset(
                        'assets/animations/animation_lmxvq6ce (1).json',
                        fit: BoxFit.fill,
                        height: MediaQuery.of(context).size.height * 0.5),
                  )
                : customsurah(model: listsurah[k]),
          ]),
        ),
      ),
    );
  }
}
