import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/models/data_user_model.dart';

class HomeController extends GetxController {

  TextEditingController nameC = TextEditingController();
  TextEditingController totalC = TextEditingController();

  RxList<DataUser> dataUser = RxList<DataUser>([]);

  void resetData() => dataUser.value.clear();
  void deleteData(int index){
    dataUser.removeAt(index);
  }
  void addData(DataUser data){
    dataUser.add(data);
  }
}
