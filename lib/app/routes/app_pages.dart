import 'package:get/get.dart';


import '../modules/my_form/my_form_binding.dart';
import '../modules/my_form/my_form_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MY_FORM;

  static final routes = [

    GetPage(
      name: _Paths.MY_FORM,
      page: () => MyFormView(),
      binding: MyFormBinding(),
    ),
  ];
}
