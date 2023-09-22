import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam/cubits/manage_nav_bar/manage_nav_bar_cubit.dart';
import 'package:islam/screens/home/homescreens/tasbih.dart';
import 'package:islam/utils/functions.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  double height = 40;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageNavBarCubit, ManageNavBarState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<ManageNavBarCubit>(context);
        return Scaffold(
          extendBody: true,
          backgroundColor: const Color(0xffE2EFFF),
          body: cubit.listscreen[cubit.currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              buttonBackgroundColor: Colors.black,
              index: cubit.currentIndex,
              onTap: (index) {
                if (index != 1) {
                  cubit.changeindex(index);
                } else {
                  go(context, tasbih());
                }
              },
              items: [
                Image(
                  height: height,
                  image: const AssetImage(
                      'assets/images/images-removebg-preview.png'),
                ),
                Image(
                  height: height,
                  image: const AssetImage(
                      'assets/images/download-removebg-preview.png'),
                ),
                Image(
                  height: height,
                  image: const AssetImage(
                      'assets/images/png-clipart-computer-icons-praying-hands-quran-2012-prayer-quraan-karem-angle-leaf-removebg-preview.png'),
                ),
                Image(
                  height: height,
                  image: const AssetImage(
                      'assets/images/pngtree-handdrawn-opened-quran-png-image_4459237-removebg-preview.png'),
                ),
              ]),
        );
      },
    );
  }
}
//  BottomNavigationBarItem(
//                     icon: Image(
//                       height: height,
//                       image: AssetImage(
//                           'assets/images/images-removebg-preview.png'),
//                     ),
//                     label: 'الصلاه'),
//                 BottomNavigationBarItem(
//                     icon: Image(
//                       height: height,
//                       image: AssetImage(
//                           'assets/images/download-removebg-preview.png'),
//                     ),
//                     label: 'التسبيح'),
//                 BottomNavigationBarItem(
//                     icon: Image(
//                       height: height,
//                       image: AssetImage(
//                           'assets/images/png-clipart-computer-icons-praying-hands-quran-2012-prayer-quraan-karem-angle-leaf-removebg-preview.png'),
//                     ),
//                     label: 'الاذكار'),
//                 BottomNavigationBarItem(
//                     icon: Image(
//                       height: height,
//                       image: AssetImage(
//                           'assets/images/pngtree-handdrawn-opened-quran-png-image_4459237-removebg-preview.png'),
//                     ),
//                     label: 'القران'),