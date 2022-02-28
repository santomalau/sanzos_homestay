import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool enabled;
  final Function()? onTap;
  final TextInputType? keyboardType;
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.label,
    required this.enabled,
    this.keyboardType,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      enableInteractiveSelection: enabled,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      onTap: onTap,
    );
  }
}
