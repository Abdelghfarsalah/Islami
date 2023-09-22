
import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:islam/constant.dart';
import 'package:islam/screens/home/widgets/customprayerTime.dart';

class azkar extends StatefulWidget {
  const azkar({super.key});

  @override
  State<azkar> createState() => _azkarState();
}

class _azkarState extends State<azkar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
  final data='${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}';
            DateTime now = new DateTime.now();
            print(data);
            print(DateTime(now.year, now.month, now.day));
          },
          child: Text('tap')),
    );
  }
}


