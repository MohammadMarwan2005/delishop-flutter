import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/delishop_colors.dart';

class DelishopTextField extends StatefulWidget {
  final String labelText;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextEditingController? textEditingController;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onChanged;
  final bool Function()? validate;

  const DelishopTextField({super.key,
    required this.labelText,
    this.isPassword = false,
    this.keyboardType,
    this.textEditingController,
    this.validator,
    this.onChanged,
    this.validate});

  @override
  State<DelishopTextField> createState() => _DelishopTextFieldState();
}

class _DelishopTextFieldState extends State<DelishopTextField> {
  Color labelColor = DelishopColors.lightGrey;
  final FocusNode _focusNode = FocusNode();
  bool isTextVisible = false;

  void _updateColor() {
    setState(() {
      labelColor =
      (widget.validator!(widget.textEditingController?.text) != null)
          ? Theme
          .of(context)
          .colorScheme
          .error
          : (_focusNode.hasFocus) ? DelishopColors.primary : DelishopColors.lightGrey;
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_updateColor);
  }

  void _textFieldValidate() {
    if (widget.validate != null) widget.validate!();
    _updateColor();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorOpacityAnimates: true,
      focusNode: _focusNode,
      onTap: () {
        _textFieldValidate();
      },
      onEditingComplete: () {
        _textFieldValidate();
      },
      onFieldSubmitted: (value) {
        _textFieldValidate();
      },
      onSaved: (newValue) {
        _textFieldValidate();
      },
      onTapOutside: (event) {
        _textFieldValidate();
      },
      onChanged: (value) {
        _textFieldValidate();
        if (widget.onChanged != null) widget.onChanged!(value);
      },
      validator: widget.validator,
      controller: widget.textEditingController,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword && !isTextVisible,
      decoration: InputDecoration(
        isDense: true,
        fillColor: DelishopColors.veryLightGrey,
        filled: true,
        suffixIcon: widget.isPassword ? buildSuffixIcon(isTextVisible) : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: DelishopColors.lightGrey, width: 2),
          borderRadius: BorderRadius.circular(16.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Theme
              .of(context)
              .colorScheme
              .error, width: 2),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: DelishopColors.primary, width: 2),
          borderRadius: BorderRadius.circular(16.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: DelishopColors.primary, width: 2),
          borderRadius: BorderRadius.circular(16.0),
        ),
        suffixIconColor: labelColor,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: labelColor),
        floatingLabelStyle: TextStyle(color: labelColor),
        contentPadding:
        widget.isPassword ? EdgeInsets.all(18.h) : EdgeInsets.all(18.h),
      ),
    );
  }

  void _invertVisibility() {
    setState(() {
      isTextVisible = !isTextVisible;
    });
  }

  Widget buildSuffixIcon(bool isVisible) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: IconButton(
            onPressed: _invertVisibility,
            icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off)),
      );

  @override
  void dispose() {
    _focusNode.removeListener(_updateColor);
    _focusNode.dispose(); // Always dispose FocusNode when no longer needed
    super.dispose();
  }
}
