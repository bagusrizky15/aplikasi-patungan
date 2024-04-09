import 'package:aplikasi_patungan/app/components/custom_card_view.dart';
import 'package:aplikasi_patungan/app/components/custom_text_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Aplikasi Patungan',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(() => (controller.totalPeople.value == 0)
          ? CustomTextButton() 
          : ListView.builder(
              itemCount: controller.totalPeople.value,
              itemBuilder: (builder, context) {
                return CustomCardView();
              })),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Get.defaultDialog(
                backgroundColor: Colors.white,
                title: "Masukkan Jumlah Orang",
                titleStyle: TextStyle(fontSize: 18),
                content:TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: "0",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    controller: controller.countPeople,
                    keyboardType: TextInputType.number,
                  ),
                cancel: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    onPressed: () {
                      controller.countPeople.text = "0";
                    },
                    child: Text(
                      "Reset",
                      style: TextStyle(color: Colors.blue),
                    )),
                confirm: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    ),
                    child: Text(
                      "OK",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                        print(controller.countPeople.text);
                        controller.totalPeople.value = int.parse(controller.countPeople.text);
                        Get.back();
                    }));
          }),
    );
  }
}
