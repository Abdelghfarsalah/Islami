import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:islam/cubits/manage_nav_bar/manage_nav_bar_cubit.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class tasbih extends StatefulWidget {
  const tasbih({super.key});

  @override
  State<tasbih> createState() => _tasbihState();
}

class _tasbihState extends State<tasbih> {
  double counter = 1;
  int number = 0;

  List<String> listtasbih = ['سبحان الله ', "الحمد لله ", 'الله اكبر'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/images/610.webp'))),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 101, 62, 6).withOpacity(0.9),
                  Colors.white.withOpacity(0.0),
                  Color.fromARGB(255, 101, 62, 6).withOpacity(0.9)
                ]),
          ),
          child: SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                          style: TextStyle(
                              fontFamily: 'NotoKufiArabic',
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w900),
                          'عن أبي هريرة - رضي الله عنه - قال: قال رسول الله - صلى الله عليه وسلم -: ((لأن أقول سبحان الله، والحمد لله، ولا إله إلا الله، والله أكبر أحب إلي مما طلعت عليه الشمس)).')),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1505),
                        border: Border.all(
                            width: 4, color: Color.fromARGB(255, 255, 213, 2)),
                        color: Colors.transparent),
                    child: Center(
                      child: Text(
                        listtasbih[number],
                        style: const TextStyle(
                            fontFamily: 'NotoKufiArabic',
                            fontSize: 60,
                            color: Color.fromARGB(255, 255, 213, 2),
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (counter == 33) {
                        if (number == 2) {
                          number = 0;
                          showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                    backgroundColor:
                                        Color.fromARGB(255, 125, 89, 6),
                                    shape: BeveledRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    title: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Text(
                                        'لا إله إلا الله وحده لا شريك له، له الملك، وله الحمد، وهو على كل شيء قدير',
                                        style: TextStyle(
                                            fontFamily: 'NotoKufiArabic',
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ));
                        } else {
                          number++;
                        }
                        counter = 1;
                      } else {
                        counter++;
                      }
                    });
                  },
                  child: Stack(
                    children: [
                    const  CircleAvatar(
                        radius: 180,
                        backgroundImage:
                            AssetImage('assets/images/images (1).jpeg'),
                        
                      ),
                      SleekCircularSlider(
                        min: 1,
                        max: 33,
                        initialValue: counter,
                        onChange: (value) {
                          setState(() {
                            int r = value.toInt();
                            counter = r.toDouble();
                          });
                        },
                        appearance: CircularSliderAppearance(
                            animationEnabled: true,
                            infoProperties: InfoProperties(
                            mainLabelStyle:const TextStyle( fontFamily: 'NotoKufiArabic',
                                fontSize: 150,
                                color: Color.fromARGB(255, 255, 213, 2),
                                fontWeight: FontWeight.w900),
                              modifier: (double value) {
                                final roundedValue =
                                    value.ceil().toInt().toString();
                                return '$roundedValue ';
                              },
                            ),
                            size: 360,
                            startAngle: 150,
                            customWidths: CustomSliderWidths(
                              trackWidth: 20,
                              progressBarWidth: 18,
                              handlerSize: 20,
                              shadowWidth: 25,
                            ),
                            customColors: CustomSliderColors(
                                trackColor: Color.fromARGB(255, 207, 151, 8),
                                progressBarColor: Colors.yellow,
                                shadowColor: Colors.yellow)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              IconButton(
            onPressed: () {
              Navigator.pop(context);
              BlocProvider.of<ManageNavBarCubit>(context).changeindex(3);
            },
            icon: const Icon(
              FontAwesomeIcons.house,
              color: Colors.grey,
            )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
