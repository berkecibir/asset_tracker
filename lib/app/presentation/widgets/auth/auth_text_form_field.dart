import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isObscure;

  const AuthTextFormField({
    super.key,
    required this.hintText,
    required this.validator,
    required this.controller,
    required this.isObscure,
  });

  factory AuthTextFormField.mail({
    required String? Function(String? email) validator,
    TextEditingController? controller,
  }) {
    return AuthTextFormField(
      isObscure: false,
      hintText: AppTexts.mailHint,
      validator: validator,
      controller: controller,
    );
  }

  factory AuthTextFormField.password({
    required String? Function(String? password) validator,
    TextEditingController? controller,
    IconData? prefixIcon,
  }) {
    return AuthTextFormField(
      isObscure: true,
      hintText: AppTexts.passwordHint,
      validator: validator,
      controller: controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: validator,
      controller: controller,
      obscureText: isObscure,
    );
  }
}
