
import 'package:bmi_calu_animation/screen/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {

        '/' : (p0) => home_screen()
      },
    ),
  );
}