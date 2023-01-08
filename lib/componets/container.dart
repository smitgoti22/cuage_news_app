import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {

  final double? height;
  final width;
  final color;
  final borderradious;
  final image;
  final child;
  final border;
  final EdgeInsets ? margin;
  final EdgeInsets ? padding;
  final LinearGradient ? linergradient;

  const CommonContainer({Key? key, this.height, this.width, this.color, this.borderradious, this.image, this.child, this.border, this.padding, this.margin, this.linergradient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        image: image,
        borderRadius: borderradious,
        border: border,
          gradient: linergradient
      ),
      child: child,
    );
  }
}
