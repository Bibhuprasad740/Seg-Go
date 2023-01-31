import 'package:flutter/material.dart';
import 'package:vidmo/global_variables.dart';
//import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class Neumorph extends StatefulWidget {
  final Widget child;
  final double borderRadius;
  final double elevation;
  final double? height, width;
  final VoidCallback? onTap;
  final Color lightColor;
  final Color? boxColor;
  const Neumorph({
    Key? key,
    required this.child,
    required this.borderRadius,
    this.elevation = 8,
    this.height,
    this.width,
    this.onTap,
    this.lightColor = const Color.fromARGB(255, 43, 42, 42),
    this.boxColor,
  }) : super(key: key);

  @override
  State<Neumorph> createState() => _NeumorphState();
}

class _NeumorphState extends State<Neumorph> {
  Offset offsetLight = const Offset(0, -2);
  Offset offsetDark = const Offset(10, 10);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap == null
          ? null
          : () {
              setState(() {
                offsetDark = const Offset(1, 1);
                offsetLight = const Offset(0, 0);
              });
              Future.delayed(const Duration(milliseconds: 200)).then((value) {
                setState(() {
                  offsetDark = const Offset(10, 10);
                  offsetLight = const Offset(0, -2);
                });
              });
              Future.delayed(const Duration(milliseconds: 300)).then((value) {
                if (widget.onTap != null) {
                  widget.onTap!();
                }
              });
            },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.center,
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.boxColor ?? GlobalVariables.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              offset: offsetLight,
              color: widget.lightColor,
            ),
            BoxShadow(
              blurRadius: 10,
              offset: offsetDark,
              color: Colors.black,
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}
