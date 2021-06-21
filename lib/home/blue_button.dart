import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final Widget child;
  final Function() onPressed;
  const BlueButton({
    Key key,
     this.child,
     this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 7),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(24)),
        child: child,
      ),
    );
  }
}
