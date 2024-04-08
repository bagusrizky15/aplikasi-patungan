
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.blue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                color: Colors.blue
              ),
            )
          )
        ),
        onPressed: (){
          Get.defaultDialog(
            title: "Petunjuk Pemakaian"
          );
      }, child: Text(
        "Petunjuk Pemakaian", 
        style: TextStyle(color: Colors.white),))
    );
  }
}
