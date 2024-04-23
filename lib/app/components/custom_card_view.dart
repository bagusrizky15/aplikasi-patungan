
import 'package:aplikasi_patungan/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardView extends StatelessWidget {
  HomeController homeC = Get.put(HomeController());
  CustomCardView({
    super.key,
    required this.index,
    this.name,
    required this.total,
  });

  int index;
  String? name;
  String total;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        width: Get.width,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${name}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),),
                  Text("Rp.${total}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),),
                  IconButton(onPressed: (){
                    homeC.deleteData(index);
                  }, icon: Icon(Icons.delete, color: Colors.grey, size: 20,))
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
