import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldComponent extends StatefulWidget {
  String fieldName;
  FormFieldValidator? validator;
  String hintText;
  IconButton? suffixIcon;
  bool? obscure;
  Icon? prefixIcon;
  TextEditingController? controller;
  TextFieldComponent(
      {super.key,
      required this.fieldName,
      this.validator,
      required this.hintText,
      this.suffixIcon,
      this.obscure = false,
      this.controller,
      this.prefixIcon});

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.fieldName,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            obscureText: widget.obscure!,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.all(15),
              hintText: widget.hintText,
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
            ),
          )
        ],
      ),
    );
  }
}
