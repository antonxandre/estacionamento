import 'package:estacionamento/app/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextFormFieldApp extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final String? labelText;
  final String? suffixText;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool? enabled;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final int? maxLines;
  final int? maxLength;
  final bool showLength;
  final bool validate;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final TextAlign? textAlign;
  final dynamic initialValue;
  final bool enableSuggestions;
  final Color fillColor;
  final AutovalidateMode autovalidateMode;
  final String? Function(String?)? validator;
  const InputTextFormFieldApp({
    Key? key,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.labelText,
    this.suffixText,
    this.controller,
    this.textInputAction,
    this.textInputType,
    this.enabled,
    this.focusNode,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.maxLength,
    this.showLength = false,
    this.validate = false,
    this.inputFormatters,
    this.textCapitalization,
    this.onChanged,
    this.onTap,
    this.textAlign,
    this.initialValue,
    this.enableSuggestions = false,
    this.fillColor = Colors.white,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: TextFormField(
        maxLines: maxLines,
        enabled: enabled,
        textAlign: textAlign ?? TextAlign.left,
        focusNode: focusNode,
        autovalidateMode: autovalidateMode,
        textInputAction: textInputAction,
        inputFormatters: inputFormatters,
        controller: controller,
        enableSuggestions: enableSuggestions,
        keyboardType: textInputType,
        minLines: 1,
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        onFieldSubmitted: onFieldSubmitted,
        initialValue: initialValue,
        onChanged: onChanged,
        validator: (value) {
          if (validate) {
            if (validator != null) {
              return validator!(value);
            }
            if (value == null || value == "") {
              return 'Obrigatório';
            }
          }
        },
        maxLength: maxLength,
        style: enabled != null && enabled == false
            ? TextStyle(color: Colors.grey.shade400)
            : const TextStyle(color: AppTheme.primary),
        decoration: InputDecoration(
            labelStyle: const TextStyle(
              height: 0.0,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
            filled: true,
            fillColor: fillColor,
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColor, width: 1.7),
            ),
            suffixIcon: suffixIcon,
            suffixText: suffixText,
            prefixIcon: prefixIcon,
            hintText: hintText,
            labelText: labelText),
      ),
    );
  }
}

/// Deixa todas as letras do keyboard maíusculas
/// Deve-se utilizar no inputFormatters []
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
