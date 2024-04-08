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
        title: Text('Aplikasi Patungan', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 2, 
        itemBuilder: (builder, context){
          return ListTile(
            leading: CircleAvatar(),
          );
        }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white,),
        onPressed: (){
          Get.defaultDialog(
            backgroundColor: Colors.white,
            title: "Masukkan Jumlah Orang", titleStyle: TextStyle(fontSize: 18),
            content: Obx(() => TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  helperText: (controller.hintTextValue.value) ? "Masukan angka" : "", 
                  helperStyle: TextStyle(color: Colors.red),
                  hintText: "0",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                controller: controller.countPeople,
                keyboardType: TextInputType.number,
              ),),
            cancel: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white),
              ),
              onPressed: (){
                Get.back();
              }, 
              child: Text("Batal", style: TextStyle(color: Colors.blue),)
              ),
            confirm: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
              ),
              child: Text("OK", style: TextStyle(color: Colors.white),),
              onPressed: (){
                if(controller.countPeople.text == "0" || controller.countPeople.text.isEmpty){
                  controller.hintTextValue.value = true;
                }else{
                  print(controller.countPeople.text);
                  Get.back();
                }
              }
            )
          );
      }),
    );
  }
}
