import 'package:flutter/material.dart';

class ValidatedFormWidget extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final bool? hiddenText;
  final String? hintText;
  final TextInputAction? action;
  final IconData? icon;
  final IconButton? visibilityButton;
  final String? Function(String?)? validator;

  const ValidatedFormWidget(
      {Key? key,
      this.controller,
      this.type,
      this.hiddenText,
      this.hintText,
      this.action,
      this.icon,
      this.visibilityButton,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      textInputAction: action,
      controller: controller,
      keyboardType: type,
      obscureText: hiddenText!,
      decoration: InputDecoration(
        suffixIcon: visibilityButton,
        hintText: hintText,
      ),
    );
  }
}
