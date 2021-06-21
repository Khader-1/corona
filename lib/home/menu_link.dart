import 'package:flutter/material.dart';

class MenuLink extends StatelessWidget {
  final String text;
  final bool isActive;
  const MenuLink( this.text, {Key key, this.isActive = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Theme.of(context).primaryColor : null,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      hoverElevation: 0,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
