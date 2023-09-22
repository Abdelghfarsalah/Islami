import 'package:flutter/material.dart';

void go(context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}