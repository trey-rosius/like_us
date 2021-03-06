import 'package:flutter/material.dart';
import 'package:like_us/apptheme/app_theme.dart';
import 'package:like_us/utils/size_config.dart';

class CustomLoginTextField extends StatelessWidget {
  final String hintTextL;
  final TextEditingController ctrl;
  final Function validation;
  final bool obscureText;
  final TextInputType type;
  final int maxLength;
  const CustomLoginTextField({
    Key key,
    @required this.hintTextL,
    @required this.ctrl,
    @required this.validation,
    this.obscureText = false,
    this.type,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validation(value),
      controller: ctrl,
      obscureText: obscureText,
      keyboardType: type,
      maxLength: maxLength,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[700], width: 2.toWidth),
          borderRadius: BorderRadius.all(
            Radius.circular(18.toWidth),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[700], width: 2.toWidth),
          borderRadius: BorderRadius.all(
            Radius.circular(18.toWidth),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeColor.primary, width: 2.toWidth),
          borderRadius: BorderRadius.all(
            Radius.circular(18.toWidth),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[700], width: 2.toWidth),
          borderRadius: BorderRadius.all(
            Radius.circular(18.toWidth),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 18.toWidth,
          vertical: 16.toHeight,
        ),
        hintText: hintTextL,
        hintStyle: TextStyle(
          color: Colors.grey[600],
          fontSize: 18.toFont,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: TextStyle(
        color: Colors.grey[400],
        fontSize: 16.toFont,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
