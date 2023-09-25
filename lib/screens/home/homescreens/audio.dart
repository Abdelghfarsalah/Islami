import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:islam/models/surahmodel.dart';
import 'package:quran/quran.dart' as q;
import 'package:just_audio/just_audio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class audiopage extends StatefulWidget {
  const audiopage({super.key, required this.model});
  final Surah model;
  @override
  State<audiopage> createState() => _audiopageState();
}

class _audiopageState extends State<audiopage> {
  double valu = 0;
  //final player = AudioPlayer()..setSource(AssetSource('images/1.mp3'));
  Duration position = Duration.zero;
  Duration duration = Duration.zero;
  bool play = true;
  bool rotate = false;
  AudioPlayer player = AudioPlayer();
  void initState() {
    super.initState();
    // player.bufferedPosition.listen((event) {
    //   setState(() {
    //     duration = event;
    //   });
    // });
    duration = player.duration ?? Duration.zero;
    player.positionStream.listen((s) {
      setState(() {
        position = s;
      });
    });
    // player.onPositionChanged.listen((event) {
    //   setState(() {
    //     position = event;
    //   });
    // });
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
                    'assets/images/صور الشيخ مشاري راشد العفاسي.jpg'))),
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
                  Stack(clipBehavior: Clip.none, children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                          color: Colors.blue.withOpacity(0.1)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.7,
                          ),
                          Slider(
                              activeColor: const Color.fromARGB(255, 7, 54, 93),
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
                                  '${position.inHours}:${position.inMinutes}:${position.inSeconds}',
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 8, 52, 87),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Spacer(),
                                Text(
                                  '${duration.inHours}:${duration.inMinutes}:${duration.inSeconds}',
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 8, 52, 87),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
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
                                    ),
                                  ),
                                ),
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
                                          if (!play) {
                                            player.stop();
                                            Fluttertoast.showToast(
                                                msg:
                                                    "صدق الله العظيم",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.blueAccent,
                                                textColor: Colors.white,
                                                fontSize: 30);
                                              
                                          } else {
                                            await player.setUrl(audio);
                                            player.play();
                                            setState(() {
                                              duration = player.duration!;
                                            });
                                          }
                                          play = !play;
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          play
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
                      top: MediaQuery.of(context).size.width * 0.6,
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
