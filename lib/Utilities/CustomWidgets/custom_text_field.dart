import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool isPassword;
  final String hintText;
  final Function(String?)? onChange;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  final Color? fillColor;
  final Color textColor;
  final Color borderColor;
  final Color hintColor;
  final Color cursorColor;

  final bool filled;
  final bool enable;
  final bool autofocus;

  final double borderRadius;
  final double paddingH;
  final double paddingV;
  final double borderWidth;
  final double opacity;

  final double fontSize;
  final FontWeight? fontWeight;

  final int maxLines;
  final int? maxLength;

  final String? Function(String? val)? validationFun;
  final TextInputType textInputType;

  CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.isPassword = false,
    this.onChange,
    this.suffixIcon,
    this.prefixIcon,
    this.fillColor,
    this.textColor = Colors.black,
    this.borderColor = Colors.grey,
    this.hintColor = Colors.grey,
    this.cursorColor = Colors.blue,
    this.filled = true,
    this.enable = true,
    this.autofocus = false,
    this.borderRadius = 12,
    this.paddingH = 16,
    this.paddingV = 14,
    this.maxLines = 1,
    this.borderWidth = 1,
    this.opacity = 1,
    this.fontSize = 14,
    this.fontWeight,
    this.maxLength,
    this.validationFun,
    this.textInputType = TextInputType.text,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChange,
      autofocus: widget.autofocus,
      enabled: widget.enable,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      keyboardType: widget.textInputType,
      validator: widget.validationFun,

      style: TextStyle(
        color: widget.textColor,
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight,
      ),

      obscureText: widget.isPassword && isHidden,

      decoration: InputDecoration(
        filled: widget.filled,
        fillColor: widget.fillColor,

        contentPadding: EdgeInsets.symmetric(
          horizontal: widget.paddingH,
          vertical: widget.paddingV,
        ),

        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: widget.hintColor,
          fontSize: widget.fontSize,
        ),

        prefixIcon: widget.prefixIcon,

        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(isHidden ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
              )
            : widget.suffixIcon,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.borderColor.withOpacity(widget.opacity),
            width: widget.borderWidth,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
      ),
    );
  }
}
