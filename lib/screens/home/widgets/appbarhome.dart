import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:islam/cubits/manage_nav_bar/manage_nav_bar_cubit.dart';

class appbarhome extends StatelessWidget {
  const appbarhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              BlocProvider.of<ManageNavBarCubit>(context).changeindex(3);
            },
            icon: const Icon(
              FontAwesomeIcons.house,
              color: Colors.grey,
            )),
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
