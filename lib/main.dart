import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_bloc_form_validation/app/routes/app_pages.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
