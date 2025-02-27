import 'package:flutter/material.dart';

class InputFieldComponent extends StatelessWidget{
  final TextEditingController controller;
  final String? labelText;
  final Widget? suffixIcon;
  final bool? readOnly;
  final FocusNode? focusNode;
  final int? maxLines;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;
  const InputFieldComponent({
    required this.controller,
    this.labelText,
    this.onTap,
    this.onEditingComplete,
    this.textInputAction,
    this.readOnly,
    this.maxLines,
    this.focusNode,
    this.suffixIcon,
    super.key
  });

  @override
  Widget build(BuildContext context){
    return TextField(
      controller: controller,
      textInputAction: textInputAction,
      readOnly: readOnly ?? false,
      maxLines: maxLines,
      focusNode: focusNode,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        // isCollapsed: true,
        hintText: labelText,
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.grey.shade400,
          fontWeight: FontWeight.w500
        ),
        floatingLabelStyle:  TextStyle(
          fontSize: 18,
          color: Colors.grey.shade400,
          fontWeight: FontWeight.w500
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2.0
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade600)
        )
      ),
    );
  }
}