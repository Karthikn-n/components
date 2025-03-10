import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldComponent extends StatelessWidget {
  final String? hintText;
  final bool? isObseure;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final int? maxLine;
  final FocusNode? focusNode;
  final bool? readOnly;
  final Widget? label;
  final double? borderRadius;
  final double? maxHeight;
  final VoidCallback? onEditingComplete;
  final Function(String value)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String value)? onFieldSubmitted;
  final String? Function(String? value)? validator;
  final VoidCallback? onTap;
  final EdgeInsets? contentPadding;
  final double? hintTextSize;
  final String? labelText;
  final String? initalValue;
  final int? maxLength;
  final bool? enableSuggestions;
  final TextEditingController? controller;
  const TextFormFieldComponent({
    super.key, 
    this.hintText, 
    this.contentPadding,
    this.controller, 
    this.isObseure = false,
    this.suffixIcon,
    this.onTap,
    this.borderRadius,
    this.label,
    this.maxLine,
    this.maxHeight,
    this.maxLength,
    this.inputFormatters,
    this.hintTextSize,
    this.readOnly,
    this.onEditingComplete,
    this.focusNode,
    this.initalValue,
    this.labelText,
    this.enableSuggestions,
    this.onFieldSubmitted,
    this.onChanged, 
    this.prefixIcon,
    this.validator,
    this.keyboardType, 
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        // maxWidth: size.width > 600 ? size.width  : size.width,
        // maxHeight: maxHeight ?? kToolbarHeight
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isObseure ?? false,
        initialValue: initalValue,
        maxLines: maxLine ?? 1,
        focusNode: focusNode,
        enableSuggestions: enableSuggestions ?? false,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        readOnly: readOnly ?? false,
        onTap: onTap,
        textInputAction: textInputAction,
        obscuringCharacter: '*',
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: onEditingComplete,
        validator: validator,
        cursorErrorColor: Colors.redAccent,
        // style: const TextStyle(
        //   fontSize: 14,
        //   fontWeight: FontWeight.w500,
        //   color: Colors.black
        // ),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          counterText: '',
          contentPadding: contentPadding,
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color:Colors.grey.withValues(alpha: 0.5)
          ),
          floatingLabelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color:Colors.grey.withValues(alpha: 0.5)
          ),
          suffixIcon: suffixIcon,
          suffixIconColor: const Color(0xFF656872).withValues(alpha: 1.0),
          hintText: hintText,
          label: label,
          hintStyle: TextStyle(
            fontSize: hintTextSize ?? 14,
            fontWeight: FontWeight.w500,
            color:Colors.grey.withValues(alpha: 1.0)
          ),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            borderSide: BorderSide(
              color: Colors.grey.withValues(alpha: 1.0)
            )
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            borderSide: BorderSide(
              color: Colors.grey.withValues(alpha: 1.0),
            )
          ),
          // fillColor: const Color(0xFF656872).withValues(alpha: 0.1),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            borderSide: const BorderSide(
              color: Colors.redAccent
            )
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            borderSide: const BorderSide(
              color: Colors.redAccent
            )
          ),
          
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            borderSide: BorderSide(
              color: Colors.grey.withValues(alpha: 1.0)
            )
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            borderSide: BorderSide(
              color: Colors.grey.withValues(alpha: 1.0)
            )
          )
        ),
      
      ),
    );
    
  }
}
