import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:islam/models/surahmodel.dart';
import 'package:quran/quran.dart' as q;

class audiopage extends StatefulWidget {
  const audiopage({super.key, required this.model});
  final Surah model;
  @override
  State<audiopage> createState() => _audiopageState();
}

class _audiopageState extends State<audiopage> {
  double valu = 0;
  final player = AudioPlayer()..setSource(AssetSource('images/1.mp3'));
  Duration position = Duration.zero;
  Duration duration = Duration.zero;
  bool play = true;
  bool rotate = false;
  void initState() {
    super.initState();
    player.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });
    player.onPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String audio = q.getAudioURLBySurah(widget.model.id);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                    'assets/images/9bd659bf4ec17a8c338206fb73d8ad9c.jpg'))),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topCenter,
                      colors: [Colors.blue, Colors.transparent])),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  Stack(clipBehavior: Clip.none, children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                          color: Colors.blue.withOpacity(0.1)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                          ),
                          Slider(
                              activeColor:const Color.fromARGB(255, 7, 54, 93),
                              inactiveColor: Colors.grey,
                              min: 0,
                              max: duration.inSeconds.toDouble(),
                              value: position.inSeconds.toDouble(),
                              onChanged: (l) {
                                setState(() {
                                  valu = l;
                                });
                              }),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Text(
                                    '${position.inHours}:${position.inMinutes}:${position.inSeconds}'),
                                Spacer(),
                                Text(
                                    '${duration.inHours}:${duration.inMinutes}:${duration.inSeconds}')
                              ],
                            ),
                          ),
                        const  SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color:
                                        const Color.fromARGB(255, 4, 30, 51)),
                                child: Center(
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          FontAwesomeIcons.house,
                                          size: 25,
                                          color: Colors.white,
                                        ))),
                              ),
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color:
                                        const Color.fromARGB(255, 4, 30, 51)),
                                child: Center(
                                    child: IconButton(
                                        onPressed: () async {
                                          print(position);
                                          print(duration);
                                          if (!play) {
                                            player.stop();
                                          } else {
                                            player.play(
                                                AssetSource('images/1.mp3'));
                                          }
                                          play = !play;
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          play!
                                              ? FontAwesomeIcons.play
                                              : FontAwesomeIcons.pause,
                                          size: 30,
                                          color: Colors.white,
                                        ))),
                              ),
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: rotate
                                        ? Color.fromARGB(255, 135, 175, 208)
                                        : const Color.fromARGB(255, 4, 30, 51)),
                                child: Center(
                                    child: IconButton(
                                        onPressed: () {
                                          // print(time.toString());
                                          setState(() {
                                            rotate = !rotate;
                                          });
                                        },
                                        icon: const Icon(
                                          FontAwesomeIcons.rotateRight,
                                          size: 30,
                                          color: Colors.white,
                                        ))),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: -100,
                      left: MediaQuery.of(context).size.width * 0.25,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(50),
                            ),
                            color: Colors.blue.withOpacity(0.5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'الاستماع الي سوره ',
                              style: TextStyle(
                                  height: 0,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              widget.model.arabicName,
                              style: const TextStyle(
                                  fontFamily: 'quran',
                                  fontSize: 50,
                                  fontWeight: FontWeight.w400),
                            ),
                            const Text(
                              'أكثرو من الصلاة على النبي محمد ﷺ',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    )
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
