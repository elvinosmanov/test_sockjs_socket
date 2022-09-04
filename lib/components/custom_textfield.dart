import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:test_sockjs_socket/core/colors.dart';
import 'package:test_sockjs_socket/core/styles.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final String? label;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool? obscureText;
  final bool? filled;
  final bool hasFocus;
  final bool hasError;
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
    this.hasFocus = false,
    this.hasError = false,
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
  Color setBorderColor() {
    if (widget.hasError) {
      return kRedColor;
    } else if (widget.hasFocus) {
      return kPurpleColor;
    } else {
      return kGreyColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Stack(
        children: [
          Container( 
            height: 56,
            decoration: BoxDecoration(
                borderRadius: kRadius8,
                border: Border.all(
                    color: setBorderColor(), width: (widget.hasFocus && !widget.hasError) ? 2 : 1)),
          ),
          Align(
              alignment: Alignment.center,
              child: TextFormField(
                style: kMediumTextStyle(16).copyWith(height: 24 / 16),
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
                cursorColor: kPurpleColor,
                cursorHeight: 24,
                cursorRadius: const Radius.circular(5),
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  labelStyle: kMediumTextStyle(16, kGreyColor),
                  floatingLabelStyle: kRegularTextStyle(12, kYellowColor),
                  helperText: widget.helperText,
                  errorText: widget.errorText,
                  prefix: widget.prefix,
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.suffixIcon,
                  suffix: widget.suffix,
                  label: widget.label != null
                      ? Text(
                          widget.label!,
                          style: kRegularTextStyle(16, kGreyColor).copyWith(height: 1.2),
                        )
                      : null,
                  contentPadding:
                      widget.contentPadding ?? const EdgeInsets.only(left: 12, top: 6, bottom: 10),
                  border: InputBorder.none,
                ),
              )),
        ],
      ),
    );
  }
}
