import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app_color_style.dart';

class ButtonController extends GetxController{
  static ButtonController instance = Get.find();

  Color k = Colors.black;
  int a = 0;

   change(int id){
     k = Colors.white ;
    update([id]);
  }

  count(){
     a++;
     update();
  }
}