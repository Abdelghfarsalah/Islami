import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:islam/screens/home/homescreens/azkar.dart';
import 'package:islam/screens/home/homescreens/boslah.dart';
import 'package:islam/screens/home/homescreens/quran.dart';
import 'package:islam/screens/home/homescreens/salahpage.dart';
import 'package:islam/screens/home/homescreens/tasbih.dart';
import 'package:meta/meta.dart';

part 'manage_nav_bar_state.dart';

class ManageNavBarCubit extends Cubit<ManageNavBarState> {
  ManageNavBarCubit() : super(ManageNavBarInitial());
  int currentIndex=0;
  List<Widget>  listscreen=const[
  salah(),
  tasbih(),
  azkar(),
  quran()
  ];
  void changeindex(int index){
    currentIndex=index;
    emit(changeindexSuccess());
  }
}
