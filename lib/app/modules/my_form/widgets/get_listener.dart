
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetListener<T extends GetxController> extends StatelessWidget {
  final String id;
  final Function() onUpdate;
  GetListener({super.key, required this.id, required this.onUpdate});

  bool afterBuild = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      id: id,
      builder: (controller) {
        if (afterBuild){
           WidgetsBinding.instance.addPostFrameCallback((_) => onUpdate());
        }   
        afterBuild = true;    
        return SizedBox.shrink();
      },
    );
  }
}