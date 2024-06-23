import 'package:ecommerce/core/config/color.dart';
import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  const InputForm({
    super.key,
    required this.title,
    this.placeholder,
    this.suffixIcon,
    this.obsecureText = false,
    this.validation,
    this.onFieldSubmitted,
    this.controller,
  });

  final String title;
  final bool obsecureText;
  final String? placeholder;
  final String? Function(String?)? validation;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: const TextStyle(color: Color(0xff0C1A30))),
        const SizedBox(height: 10),
        TextFormField(
          controller: widget.controller,
          onFieldSubmitted: widget.onFieldSubmitted,
          validator: widget.validation,
          obscureText: widget.obsecureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.offGrey,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            hintText: widget.placeholder,
            hintStyle: const TextStyle(fontSize: 14, color: Color(0xffC4C5C4)),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: widget.suffixIcon,
          ),
        ),
      ],
    );
  }
}
