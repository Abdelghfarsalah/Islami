import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:islam/cubits/manage_nav_bar/manage_nav_bar_cubit.dart';
import 'package:islam/screens/home/search.dart';
import 'package:islam/utils/functions.dart';

class quranAppBar extends StatelessWidget {
  const quranAppBar({super.key, required this.string});
  final String string;
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
        Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              string,
              style: const TextStyle(
                  fontFamily: 'quran',
                  fontSize: 30,
                  fontWeight: FontWeight.w900),
            )),
        const Spacer(),
        IconButton(
            onPressed: () {
              go(context, const search());
            },
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ))
      ],
    );
  }
}
