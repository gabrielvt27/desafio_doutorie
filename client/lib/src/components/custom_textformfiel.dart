import 'package:flutter/material.dart';

import 'package:client/src/constants.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.label,
    this.hintText,
    this.keyboardType,
    this.onChanged,
    this.controller,
    this.validator,
    this.inputFormatters,
  }) : super(key: key);

  final String label;
  final String? hintText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label:",
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: kDefaultPadding / 4,
        ),
        TextFormField(
          inputFormatters: inputFormatters,
          controller: controller,
          validator: validator,
          onChanged: onChanged,
          keyboardType: keyboardType,
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: kPrimaryColor,
                width: 3,
              ),
              borderRadius: BorderRadius.zero,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: kPrimaryColor,
                width: 3,
              ),
              borderRadius: BorderRadius.zero,
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: kPrimaryColor,
                width: 3,
              ),
              borderRadius: BorderRadius.zero,
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: kPrimaryColor,
                width: 3,
              ),
              borderRadius: BorderRadius.zero,
            ),
          ),
        ),
      ],
    );
  }
}
