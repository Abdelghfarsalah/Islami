import 'package:flutter/material.dart';
import 'package:islam/main.dart';

void go(context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

int findsurah({required String text}){
  int x;
  for(int i=0;i<listsurah.length;i++)
  {
    if(text==listsurah[i].id.toString()){
      return i;
    }
  }

return -1;

}