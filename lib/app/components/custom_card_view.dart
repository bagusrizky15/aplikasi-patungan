
import 'package:aplikasi_patungan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardView extends StatelessWidget {
  const CustomCardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
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
                  Text("Joko Susanto", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),),
                  Text("Rp. 20.000", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),)
                ],
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue
                ),
                child: ListTile(
                  title: Text("Nasi Goreng", style: TextStyle(color: Colors.white, fontSize: 16),),
                  trailing: Text("Rp. 20.000", style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(color: Colors.blue))
                    ),
                    onPressed: (){
                    Get.toNamed(Routes.EDIT_VIEW);
                    debugPrint("Goto EditView");
                  }, child: Text("Edit", style: TextStyle(color: Colors.blue),))
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
