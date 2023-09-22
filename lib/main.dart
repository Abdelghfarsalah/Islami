import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam/cubits/manage_nav_bar/manage_nav_bar_cubit.dart';
import 'package:islam/screens/splash.dart';

void main() {
  
  runApp(const islamapp());
}

class islamapp extends StatelessWidget {
  const islamapp({super.key});

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
