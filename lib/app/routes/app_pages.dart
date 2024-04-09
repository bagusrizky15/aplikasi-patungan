import 'package:get/get.dart';

import '../modules/edit_view/bindings/edit_view_binding.dart';
import '../modules/edit_view/views/edit_view_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_VIEW,
      page: () => const EditViewView(),
      binding: EditViewBinding(),
    ),
  ];
}
