import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final text;
  final double ? size;
  final color;
  final fontfamily;
  final fontweight;
  final maxlines;
  final textalign;
  final textwrap;
  final overflow;
  final double ? letterspacing;

  const CommonText(
      {Key? key,
      required this.text,
      this.size = 14,
      this.fontfamily = "NunitoRegular",
      this.color,
      this.fontweight, this.maxlines, this.textalign, this.letterspacing, this.textwrap, this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxlines,
      textAlign: textalign,
      softWrap: textwrap,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontFamily: fontfamily,
          fontWeight: fontweight,
        overflow: overflow,
        letterSpacing: letterspacing
      ),
    );
  }
}
