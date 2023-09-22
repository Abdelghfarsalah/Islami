import 'package:flutter/material.dart';
import 'package:islam/models/salahmodel.dart';
import 'package:islam/screens/home/homescreens/salahpage.dart';
import 'package:islam/screens/splash.dart';

class prayertime extends StatelessWidget {
  const prayertime({super.key,required this.model});
  final salahmodel model; 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        children: [
          SizedBox(
            height:  MediaQuery.of(context).size.height*0.180,
            width:  MediaQuery.of(context).size.width*0.28,
            child: Container(
              decoration: BoxDecoration(
                borderRadius:const BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(model.image))
              ),
            child: Column(
              children: [
              const  Spacer(),
                Text(model.prayer,style:const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Colors.white
                ),),
            const  SizedBox(height: 20,)
              ],
            ),
            ),
          ),

        Text('${model.name} ',style:const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w900
        ),)
        ],
      ),
    );
  }
}