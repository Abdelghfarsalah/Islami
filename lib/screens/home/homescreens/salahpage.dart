import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:islam/constant.dart';
import 'package:islam/models/salahmodel.dart';
import 'package:islam/screens/home/widgets/appbarhome.dart';
import 'package:islam/screens/home/widgets/customprayerTime.dart';

class salah extends StatefulWidget {
  const salah({super.key});

  @override
  State<salah> createState() => _salahState();
}

class _salahState extends State<salah> {
  var now = DateFormat.jm().format(DateTime.timestamp());
  var n=DateTime.now().difference(DateTime.now());
  var data =
      '${DateTime.timestamp().year}/${DateTime.timestamp().month}/${DateTime.timestamp().day}';
  List<salahmodel> listsalah = [
    salahmodel(image: 'assets/images/alfagr.jpg', name: 'الفجر', prayer: fajr1),
    salahmodel(image: 'assets/images/Duhar.jpg', name: 'الضهر', prayer: dhuhr),
    salahmodel(image: 'assets/images/alasr.webp', name: 'العصر', prayer: asr),
    salahmodel(
        image: 'assets/images/maghrab.jpg', name: 'المغرب', prayer: maghrib),
    salahmodel(image: 'assets/images/alasha.jpg', name: 'العشاء', prayer: isha),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/images/5b97b9f5c78d5cb05becdd31a599acb0.jpg'))),
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const appbarhome(),
          const SizedBox(
            height: 0,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'My Location',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Auto Detect',
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.27,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/alfagr.jpg'))),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                                Text(
                                  now,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(40, 40),
                                    backgroundColor: Colors.greenAccent),
                                onPressed: () {},
                                child: const Icon(
                                  FontAwesomeIcons.bell,
                                  size: 20,
                                  color: Colors.black,
                                )),
                          )
                        ],
                      ),
                    ),
                    Text('استعد  لصلاه الفجر ',style:const TextStyle(
                      color: Colors.white,
                      fontSize: 30
                    ),),
                    Text('لا تنسي صلاه العشاء ',style:const TextStyle(
                      color: Colors.white,
                      fontSize: 15
                    ),)
                  ]),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.22,
                  right: 8,
                  left: 8,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.bookQuran,
                                color: Colors.green,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'ايه اليوم',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        height: 1),
                                  ),
                                  Text(data, style: TextStyle()),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(FontAwesomeIcons.bookmark,
                                      color: Colors.green)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(FontAwesomeIcons.shareNodes,
                                      color: Colors.blue)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_circle_up,
                                      color: Colors.green)),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          height: 1,
                          endIndent: 10,
                          indent: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('sasackmkdj kadsfhkjadhk fmdlkdjf')
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.159,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'مواعيد صلاه اليوم   ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.green),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: listsalah.length,
                    itemBuilder: (context, index) => prayertime(
                          model: listsalah[index],
                        )),
              )
            ],
          )
        ],
      )),
    );
  }
}
