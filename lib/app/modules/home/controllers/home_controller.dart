import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class HomeController extends GetxController {
  TextEditingController countPeople = TextEditingController();
  RxBool hintTextValue = false.obs;
}
