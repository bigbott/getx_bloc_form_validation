import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_bloc_form_validation/app/modules/my_form/widgets/email_input.dart';
import 'package:getx_bloc_form_validation/app/modules/my_form/widgets/get_listener.dart';
import 'package:getx_bloc_form_validation/app/modules/my_form/widgets/password_input.dart';
import 'package:getx_bloc_form_validation/app/modules/my_form/widgets/submit_button.dart';
import 'package:getx_bloc_form_validation/app/modules/my_form/widgets/success_dialog.dart';

import 'my_form_controller.dart';

class MyFormView extends GetView<MyFormController> {
  const MyFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Align(
          alignment: const Alignment(0, -3 / 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              EmailInput(focusNode: controller.emailFocusNode),
              PasswordInput(focusNode: controller.passwordFocusNode),
              const SizedBox(height: 40),
              const SubmitButton(),
              GetListener<MyFormController>(
                  id: 'dialog',
                  onUpdate: () {
                    _showDialog(context);
                  }),
              GetListener<MyFormController>(
                  id: 'snackbar',
                  onUpdate: () {
                    _showSnackbar(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  _showDialog(context) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      showDialog<void>(
        context: context,
        builder: (_) => const SuccessDialog(),
      );
  }

  _showSnackbar(BuildContext context) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('Submitting...')),
        );
  }
}
