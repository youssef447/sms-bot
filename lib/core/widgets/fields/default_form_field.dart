import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Objectives: This file is responsible for providing default text form field widget that is used in the app.
class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.showBorder,
    this.enabledBorder,
    this.textAlign,
    this.width,
    this.inputTextStyle,
    this.hintStyle,
    this.style,
    this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backGroundColor,
    this.onChanged,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.prefixIcon2,
    this.label,
    this.readOnly,
    this.enabled,
    this.onTap,
    this.top,
    this.bottom,
    this.maxLength,
    this.expands,
    this.keyboardType,
    this.autovalidateMode,
    this.height,
    this.labelText,
    this.minLines,
    this.maxLines,
    this.collapsed,
    this.defaultHeight,
    this.textDirection,
    this.alignCounterTextLeft = false,
    this.showCounter = false,
    this.helperText,
  });

  final TextAlign? textAlign;
  final int? maxLength;
  final bool? defaultHeight;
  final bool? collapsed;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String)? onChanged;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle, style;
  final String? hintText;
  final bool? isObscureText, readOnly, enabled, showBorder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefixIcon2;
  final Widget? label;
  final Color? backGroundColor;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double? top, bottom;
  final double? height;
  final double? width;
  final AutovalidateMode? autovalidateMode;
  final void Function()? onTap;
  final bool? expands;
  final TextInputType? keyboardType;
  final String? labelText;
  final int? minLines;
  final int? maxLines;
  final TextDirection? textDirection;
  final bool alignCounterTextLeft;
  final bool showCounter;
  final String? helperText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: textDirection,
      textInputAction: TextInputAction.done,
      keyboardType: keyboardType,
      expands: expands ?? false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTap: onTap,
      controller: controller,
      onChanged: onChanged,
      minLines: minLines,
      maxLines: maxLines,
      readOnly: readOnly ?? false,
      enabled: enabled,
      maxLength: maxLength,
      textAlignVertical: TextAlignVertical.center,
      textAlign: textAlign ?? TextAlign.start,
      cursorColor: Theme.of(context).colorScheme.primary,
      decoration: InputDecoration(
        helperText: helperText,
        hintStyle: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(color: Colors.grey),
        isCollapsed: collapsed,
        errorStyle: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: Colors.red),
        labelText: labelText,
        label: label,
        contentPadding: contentPadding,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: showBorder ?? false
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide.none,
              )
            : InputBorder.none,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        hintText: hintText,
        fillColor: Theme.of(context).colorScheme.surfaceContainer,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: Theme.of(context).textTheme.headlineLarge,
      validator: validator,
    );
  }
}
