import 'package:aplikasi_patungan/app/components/custom_card_view.dart';
import 'package:aplikasi_patungan/app/components/custom_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../../../data/models/data_user_model.dart';
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
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          TextButton(
              onPressed: () {
                debugPrint("-- RESET --");
                controller.resetData();
              },
              child: Text(
                "Reset",
                style: TextStyle(color: Colors.white),
              ))
        ],
        centerTitle: true,
      ),
      body: Obx(() => (controller.dataUser.value.length == 0)
          ? CustomTextButton()
          : ListView.builder(
              itemCount: controller.dataUser.value.length,
              itemBuilder: (builder, index) {
                return CustomCardView(
                  index: index,
                  name : controller.dataUser.value[index].nama,
                  total: controller.dataUser.value[index].total.toString(),
                );
              },),),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: (){
            
            },
            child: Text("Hitung", 
            style: TextStyle(color: Colors.white),),
          ),
          SizedBox(width: 10,),
          FloatingActionButton(
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Get.dialog(_popUp());
              }),
        ],
      ),
    );
  }

  Widget _popUp() {
    return Dialog(
        child: Container(
          height: 250,
          padding: EdgeInsets.all(10),
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller.nameC,
                decoration: InputDecoration(
                  labelText: "Nama",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: controller.totalC,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Total yang harus dibayar",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){
                  if(controller.nameC.text == "" && controller.totalC.text == ""){
                    Get.back();
                  } else if (controller.nameC.text == "" || controller.totalC.text == ""){
                    Get.snackbar("Error", "Data harus diisi semua", colorText: Colors.white, backgroundColor: Colors.red, duration: Duration(seconds: 1));
                  } else {
                    controller.addData(
                      DataUser(
                        nama: controller.nameC.text,
                        total: int.parse(controller.totalC.text),
                      )
                    );
                    controller.nameC.clear();
                    controller.totalC.clear();
                    Get.back();
                  }
              }, child: Text("Tambah"))
            ],
          ),
        ));
  }
}
