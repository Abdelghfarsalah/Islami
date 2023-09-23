import 'package:flutter/material.dart';
import 'package:islam/models/azkarmodel.dart';
import 'package:islam/screens/home/homescreens/Azkar/sabah.dart';
import 'package:islam/utils/functions.dart';

class azkarbox extends StatelessWidget {
  const azkarbox({super.key, required this.text,required this.l});
  final azkarmodel text;
  final int l;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(l==0)
        {
          go(context,const azkarSabah());
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(text.image))),
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.centerLeft,
                    colors: [Colors.black, Colors.transparent])),
            child:Row
            (
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Text(
                '${text.name}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900),
              ),
            const  SizedBox(width: 20,)
            ]),
          ),
        ),
      ),
    );
  }
}
