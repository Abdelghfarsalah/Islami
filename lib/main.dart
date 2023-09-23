import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam/cubits/manage_nav_bar/manage_nav_bar_cubit.dart';
import 'package:islam/models/surahmodel.dart';
import 'package:islam/screens/splash.dart';

void main() {
  
  runApp(const islamapp());
}

class islamapp extends StatefulWidget {
  const islamapp({super.key});

  @override
  State<islamapp> createState() => _islamappState();
}
 List<Surah> listsurah = [];
class _islamappState extends State<islamapp> {
   

  @override
  void initState() {
    super.initState();
    readsurah();
  }

  Future<void> readsurah() async {
    final String response = await rootBundle.loadString('assets/surah.json');
    final data = await json.decode(response);
    for (var element in data["chapters"]) {
      listsurah.add(Surah.fromMap(element));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
      BlocProvider(
        create: (context) => ManageNavBarCubit(),
      )
      ],
      child:const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: splash(),
      ),
    );
  }
}
