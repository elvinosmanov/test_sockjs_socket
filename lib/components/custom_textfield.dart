import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:test_sockjs_socket/core/colors.dart';
import 'package:test_sockjs_socket/core/styles.dart';
import 'package:test_sockjs_socket/extensions/text_style_extension.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final String? label;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool? obscureText;
  final bool? filled;
  final int? maxLines;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? helperText;
  final Widget? suffix;
  final Widget? prefix;
  final void Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final String? hintText;
  final String? errorText;
  final Function()? onTap;

  final bool? enabled;

  const CustomTextField({
    Key? key,
    this.label,
    required this.controller,
    this.focusNode,
    this.obscureText,
    this.filled,
    this.maxLines,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.suffixIcon,
    this.prefixIcon,
    this.helperText,
    this.suffix,
    this.prefix,
    this.onEditingComplete,
    this.textInputAction,
    this.validator,
    this.inputFormatters,
    this.contentPadding,
    this.hintStyle,
    this.hintText,
    this.errorText,
    this.onTap,
    this.enabled,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // style: kMediumTextStyle(16).copyWith(height: 1),
      controller: widget.controller,
      focusNode: widget.focusNode,
      inputFormatters: widget.inputFormatters,
      obscureText: widget.obscureText ?? false,
      enabled: widget.enabled,
      maxLines: (widget.obscureText ?? false) ? 1 : widget.maxLines,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      onTap: widget.onTap,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      onFieldSubmitted: widget.onSubmitted,
      validator: widget.validator,
      onEditingComplete: widget.onEditingComplete,
      cursorHeight: 24,
      cursorColor: kPurpleColor,
      decoration: InputDecoration(
        labelStyle: kMediumTextStyle(16, kGreyColor),

        helperText: widget.helperText,
        // helperStyle: kRegularTextStyle(12, kGreyColor),
        // filled: true ?? widget.filled ?? false,
        // fillColor: Colors.red.withOpacity(0.4),
        // errorStyle: kRegularTextStyle(11, kRedColor),
        // errorMaxLines: 3,
        errorText: widget.errorText,
        prefix: widget.prefix,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        suffix: widget.suffix,
        // isDense: true,
        // isCollapsed: true,

        // hintText: widget.hintText,
        // hintStyle: widget.hintStyle ?? kSemiBoldTextStyle(15, kGreyColor),
        label: widget.label != null
            ? Text(
                widget.label!,
                style: kRegularTextStyle(16, kGreyColor),
              )
            : null,
        contentPadding: widget.contentPadding ?? const EdgeInsets.only(left: 12),
        border: InputBorder.none,
        // enabledBorder: customOutlineInputBorder(color: kLightGreyColor, width: 1),
        // focusedBorder: customOutlineInputBorder(color: kLightGreyColor, width: 1),
        // focusedErrorBorder: customOutlineInputBorder(color: kRedColor, width: 1),
        // errorBorder: customOutlineInputBorder(color: kRedColor, width: 1),
        // border: customOutlineInputBorder(color: kLightGreyColor, width: 1),
      ),
    );
  }

  OutlineInputBorder customOutlineInputBorder({required Color color, required double width}) {
    return OutlineInputBorder(
      borderRadius: kRadius8,
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
    );
  }
}
