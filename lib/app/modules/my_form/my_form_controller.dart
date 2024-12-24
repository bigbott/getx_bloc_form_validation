import 'package:get/get.dart';
import 'package:formz/formz.dart';
import 'package:getx_bloc_form_validation/app/data/models.dart';
import 'package:flutter/material.dart';
import 'package:getx_bloc_form_validation/app/data/my_form_state.dart';

class MyFormController extends GetxController {

  var state = MyFormState();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    emailFocusNode.addListener(() {
      if (!emailFocusNode.hasFocus) {
        onEmailUnfocused();
        Future.delayed(Duration(milliseconds: 50), () {
          FocusScope.of(Get.context!).requestFocus(passwordFocusNode);
        });
      }
    });
    passwordFocusNode.addListener(() {
      if (!passwordFocusNode.hasFocus) {
        onPasswordUnfocused();
      }
    });
  }

  @override
  void onClose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.onClose();
  }

  void onEmailChanged(String value) {
    final email = Email.dirty(value);
    state = state.copyWith(
      email: email.isValid ? email : Email.pure(value),
      isValid: Formz.validate([email, state.password]),
      status: FormzSubmissionStatus.initial,
    );
     update();
  }

  void onPasswordChanged(String value) {
    final password = Password.dirty(value);
    state = state.copyWith(
      password: password.isValid ? password : Password.pure(value),
      isValid: Formz.validate([state.email, password]),
      status: FormzSubmissionStatus.initial,
    );
    update();
  }

  void onEmailUnfocused() {
    final email = Email.dirty(state.email.value);
    state = state.copyWith(
      email: email,
      isValid: Formz.validate([email, state.password]),
      status: FormzSubmissionStatus.initial,
    );
    update();
  }

  void onPasswordUnfocused() {

    final password = Password.dirty(state.password.value);
    state = state.copyWith(
        password: password,
        isValid: Formz.validate([state.email, password]),
        status: FormzSubmissionStatus.initial,
      );
    update();
  }


  Future<void> onFormSubmitted() async {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    state = state.copyWith(
        email: email,
        password: password,
        isValid: Formz.validate([email, password]),
        status: FormzSubmissionStatus.initial,
    );
    update();

    if (state.isValid) {
      state = state.copyWith(status: FormzSubmissionStatus.inProgress);
      update(['snackbar']);
      await Future<void>.delayed(const Duration(seconds: 1));
      state = state.copyWith(status: FormzSubmissionStatus.success);
      update(['dialog']);
    }

  }
}
