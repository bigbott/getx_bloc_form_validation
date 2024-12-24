import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_bloc_form_validation/app/modules/my_form/my_form_controller.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({required this.focusNode, super.key});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFormController>(
      builder: (controller) {
        return TextFormField(
          initialValue: controller.state.email.value,
          focusNode: focusNode,
          decoration: InputDecoration(
            icon: const Icon(Icons.email),
            labelText: 'Email',
            helperText: 'A complete, valid email e.g. joe@gmail.com',
            errorText: controller.state.email.displayError != null
                ? 'Please ensure the email entered is valid'
                : null,
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: controller.onEmailChanged,
          textInputAction: TextInputAction.next,
        );
      }
    );
  }
}
