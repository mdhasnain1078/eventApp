import 'package:flutter/material.dart';
import '../../../common/utils/appColors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.readyOnly,
      this.textAlign,
      required this.keyboardType,
      this.prefixText,
      this.onTap,
      this.suffixIcon,
      this.onChanged, this.fontSize, this.autofocus, this.prefixIcon, this.focusNode, this.onFieldSubmitted});

  final TextEditingController? controller;
  final String? hintText;
  final bool? readyOnly;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final String? prefixText;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final double? fontSize;
  final bool ? autofocus;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.black,
      focusNode: focusNode,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted ,
      controller: controller,
      readOnly: readyOnly?? false,
      textAlign: textAlign?? TextAlign.center,
      keyboardType: readyOnly == null ? keyboardType : null,
      onChanged: onChanged,
      autofocus: autofocus ?? false,
      style: TextStyle(fontSize: fontSize),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        border: InputBorder.none,
        isDense: true,
        prefixText: prefixText,
        suffix: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.grey, fontSize: 20, fontWeight: FontWeight.w400),
        // enabledBorder: const  UnderlineInputBorder(borderSide: BorderSide(width: 1, color: AppColors.black)),
        // focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(width: 1, color: AppColors.black)),
        )
      );
  }
}
