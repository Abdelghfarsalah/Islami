import 'package:flutter/material.dart';

class cardazkar extends StatelessWidget {
  const cardazkar(
      {super.key,
      required this.number,
      required this.text,
      required this.index});
  final String text;
  final int number;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 20,
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(50)),
                      color: Colors.orangeAccent),
                  height: 50,
                  width: 50,
                  child: Center(
                      child: Text(
                    '  $index',
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w900),
                  )),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'assets/images/quran/png-clipart-quran-islam-tafsir-ayah-dua-golden-atmosphere-badge-round-yellow-floral-rectangle-arabic-removebg-preview.png')),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                height: 80,
                width: 100,
                child: Center(
                    child: Text(
                  '$number',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w900),
                )),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
