import 'package:get/get.dart';

import '../controllers/edit_view_controller.dart';

class EditViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditViewController>(
      () => EditViewController(),
    );
  }
}
