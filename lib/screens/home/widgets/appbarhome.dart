import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class appbarhome extends StatelessWidget {
  const appbarhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {}, icon: const Icon(FontAwesomeIcons.grip)),
        const Spacer(),
        const Text('مواعيد الصلاه',style: TextStyle(
          fontFamily: 'quran',
          fontSize: 30,
          fontWeight: FontWeight.bold

        ),),
        const Spacer(),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.people_alt_rounded)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      ],
    );
  }
}
