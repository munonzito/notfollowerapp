import 'package:flutter/material.dart';

Widget buildTextFormField(
    {required String label,
    required TextEditingController controller,
    bool obscureText: false,
    dynamic validator: null,
    double? width: 200}) {
  final color = Colors.black;
  return SizedBox(
      width: width == null ? 200 : width,
      child: TextFormField(
        validator: validator,
        obscureText: obscureText,
        controller: controller,
        style: TextStyle(color: color),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            hintText: label,
            filled: true,
            fillColor: Colors.white12,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: color.withOpacity(0.7))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: color.withOpacity(0.7))),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: color.withOpacity(0.7))),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: color.withOpacity(0.7)))),
      ));
}
