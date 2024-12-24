import 'package:get/get.dart';

import 'my_form_controller.dart';

class MyFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyFormController>(
      () => MyFormController(),
    );
  }
}
