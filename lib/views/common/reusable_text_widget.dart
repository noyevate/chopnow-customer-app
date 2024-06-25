import 'package:flutter/material.dart';

class ReuseableText extends StatelessWidget {
  final String title;
  final TextStyle style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const ReuseableText({
    super.key,
    required this.title,
    required this.style,
    this.textAlign, this.overflow
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style,
      textAlign: textAlign ?? TextAlign.left,
      overflow: overflow,
      softWrap: false,
    );
  }
}