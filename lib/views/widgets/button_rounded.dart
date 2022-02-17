import 'package:flutter/material.dart';
import 'package:musix_app/utils/Size.dart';
import 'package:musix_app/utils/Theme.dart';

class RoundedButton extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final double? width;
  final BorderSide? border;
  final Function()? press;

  const RoundedButton({Key? key, this.color, this.child, this.width, this.border, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? SizeUtil.width(context) * 0.70,
      child: TextButton(
        onPressed: press ?? () {},
        style: TextButton.styleFrom(
          backgroundColor: color ?? Pallete.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: border ?? BorderSide.none,
          ),
        ),
        child: child ??
            const Text(
              "Masuk",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
      ),
    );
  }
}
