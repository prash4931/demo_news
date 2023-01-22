import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextFormField extends StatelessWidget {
  const CommonTextFormField(
      {Key? key,
      this.focusNode,
      this.height,
      this.maxLength,
      this.maxLines,
      this.textInputAction,
      this.hintText,
      this.controller,
      this.readOnly,
      this.isImportantStarLabelRequired,
      this.obscureText,
      this.isFixedlabel,
      this.isDense,
      this.onSubmittedRequired,
      this.autofocus,
      this.isSuffixIconRequired,
      this.keyboardType,
      this.onChanged,
      this.onTap,
      this.suffixIcon,
      this.labelHeading,
      this.inputFormatters,
      this.errorText,
      this.isfilled = false,
      this.textAlign,
      this.textAlignVertical,
      this.hintStyle,
      this.customDateError,
      this.isMobileValidationRequired,
      this.isEmailValidationRequired,
      this.isPasswordValidationRequired,
      this.compareWithcontroller,
      this.compareWithPrevious = false,
      this.compareErrorText,
      this.isPrefixIconRequired,
      this.prefixIcon})
      : super(key: key);

  final FocusNode? focusNode;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextStyle? hintStyle;
  final double? height;
  final int? maxLength;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final String? hintText;
  final String? errorText;
  final String? compareErrorText;
  final TextEditingController? controller;
  final TextEditingController? compareWithcontroller;
  final bool? readOnly;
  final bool? isImportantStarLabelRequired;
  final bool? obscureText;
  final bool? isFixedlabel;
  final bool? isDense;
  final bool? onSubmittedRequired;
  final bool? isfilled;
  final bool? isMobileValidationRequired;
  final bool? isEmailValidationRequired;
  final bool? isPasswordValidationRequired;
  final bool? customDateError;

  final bool? autofocus;
  final bool? compareWithPrevious;
  final bool? isSuffixIconRequired;
  final bool? isPrefixIconRequired;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final String? labelHeading;

  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    bool error = false;
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofocus: autofocus ?? false,
      focusNode: focusNode,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      readOnly: readOnly ?? false,
      onTap: onTap,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction ?? TextInputAction.next,
      controller: controller,
      obscureText: obscureText ?? false,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onFieldSubmitted: onSubmittedRequired == true
          ? (_) => FocusScope.of(context).nextFocus()
          : null,
      // style: baseTextTheme.textFieldValueTextStyle,
      textCapitalization: TextCapitalization.sentences,
      textAlign: textAlign ?? TextAlign.start,
      textAlignVertical: textAlignVertical,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          prefixIcon: isPrefixIconRequired == true ? prefixIcon : null,
          suffixIcon: isSuffixIconRequired == true ? suffixIcon : null,
          suffixIconConstraints:
              const BoxConstraints(minWidth: 20, minHeight: 20),
          prefixIconConstraints:
              const BoxConstraints(minWidth: 20, minHeight: 20),
          isDense: true,
          hintText: hintText ?? '',
          // hintStyle: hintStyle ?? baseTextTheme.textFieldHintTextStyle,
          // errorStyle:
          //     TextStyle(fontSize: 13, color: baseColorTheme.reOpenStatus),
          floatingLabelBehavior:
              isFixedlabel == true ? FloatingLabelBehavior.always : null,
          label: labelHeading != null
              ? RichText(
                  text: TextSpan(children: [
                  TextSpan(
                    text: labelHeading,
                    // style: baseTextTheme.textFieldHintTextStyle,
                  ),
                  if (isImportantStarLabelRequired == true)
                    TextSpan(
                      text: " *",
                      // style: baseTextTheme.textFieldHintTextStyle
                      //     .copyWith(color: baseColorTheme.reOpenStatus)
                    ),
                ]))
              : null,
          focusedErrorBorder: OutlineInputBorder(
              // borderSide:
              //     BorderSide(color: baseColorTheme.importantStarTextColor)
              ),
          errorBorder: (controller != null && controller!.text.isNotEmpty)
              ? null
              : OutlineInputBorder(
                  // borderSide:
                  //     BorderSide(color: baseColorTheme.importantStarTextColor)
                  ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          enabledBorder: OutlineInputBorder(
              // borderSide:
              //     BorderSide(color: baseColorTheme.textfieldInputBorderColor)
              ),
          border: OutlineInputBorder(
              // borderSide:
              //     BorderSide(color: baseColorTheme.textfieldInputBorderColor)
              )),
      validator: (value) {
        value!.trim().isNotEmpty ? error = !error : error = error;
        if (customDateError == true) {
          if (hintText != null) {
            if (value.toLowerCase() == hintText!.toLowerCase()) {
              return errorText;
            }
          }
        }
        if (value.isEmpty) {
          return errorText;
        }
        if (compareWithPrevious == true) {
          if (compareWithcontroller != null) {
            if (value != compareWithcontroller!.text) {
              return compareErrorText ??
                  'Make sure your field matches with above';
            }
          }
        }
        if (isMobileValidationRequired == true) {
          if (value.length > 10 || value.length < 10) {
            return "Please Enter Valid Mobile Number";
          }
        }

        if (isEmailValidationRequired == true) {
          if (!RegExp(
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(value)) {
            return "Please Enter Valid Email ID";
          }
        }
        if (isPasswordValidationRequired == true) {
          if (!RegExp(
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')
              .hasMatch(value)) {
            return "Atleast 6 char, 1 Caps, 1 Small, 1 Num, 1 Symbol";
          }
        }
        return null;
      },
    );
  }
}
