import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function() onTap;
  final String? text;
  final Color? buttonColor;
  final double? width;
  final double? height;
  final bool isMargin;
  final EdgeInsets? margin;
  const AppButton({
    Key? key,
    required this.onTap,
    this.text,
    this.buttonColor,
    this.width,
    this.height,
    this.isMargin = false,
    this.margin = const EdgeInsets.all(12.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isMargin ? margin : EdgeInsets.zero,
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? MediaQuery.of(context).size.height * 0.065,
      decoration: BoxDecoration(
        color: buttonColor ?? Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: buttonColor ?? Theme.of(context).primaryColor,
          elevation: 3,
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            text ?? "",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
