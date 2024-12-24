import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_bloc_form_validation/app/modules/my_form/my_form_controller.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    
      return GetBuilder<MyFormController>(
        builder: (controller) {
          return ElevatedButton(
            onPressed: controller.state.isValid
                ? controller.onFormSubmitted
                : null,
            child: const Text('Submit'),
          );
        }
      );
  }
}
