import 'package:flutter/material.dart';

class LabelStatus extends StatelessWidget {
  final Color? color;
  final Color? colorBackground;
  final String titleLabel;
  final double fontSize;
  final double borderRadius;
  final FontWeight fontWeight;
  const LabelStatus(
      {Key? key,
      this.color,
      this.colorBackground,
      required this.titleLabel,
      this.fontSize = 12,
      this.borderRadius = 4,
      this.fontWeight = FontWeight.w600
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: colorBackground,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        titleLabel,
        style:
            TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }
}