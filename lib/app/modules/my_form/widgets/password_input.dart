import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_bloc_form_validation/app/modules/my_form/my_form_controller.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({required this.focusNode, super.key});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFormController>(
      builder: (controller) {
        return TextFormField(
          initialValue: controller.state.password.value,
          focusNode: focusNode,
          decoration: InputDecoration(
            icon: const Icon(Icons.lock),
            helperText:
                'Password should be at least 8 characters with at least one letter and number',
            helperMaxLines: 2,
            labelText: 'Password',
            errorMaxLines: 2,
            errorText: controller.state.password.displayError != null
                ? 'Password must be at least 8 characters and contain at least one letter and number'
                : null,
          ),
          obscureText: true,
          onChanged: controller.onPasswordChanged,
          textInputAction: TextInputAction.done,
        );
      }
    );
  }
}
