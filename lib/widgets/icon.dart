import 'package:flutter/material.dart';
import 'package:notes/themes/themes.dart';

class ButttonIcon {
  final icon;
  final double size;
  final Function onpressed;

  ButttonIcon({this.icon, this.onpressed, this.size: 26});

  floatingIcon() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: RaisedButton(
        onPressed: onpressed,
        color: Color(0xFF2f2f2f),
        shape: CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Icon(
            icon,
            size: 35,
            color: Colors.white60,
          ),
        ),
      ),
    );
  }

  appbarIcons() {
    return IconButton(
      splashColor: Themes.bgColor,
      icon: Icon(
        icon,
        size: size,
        color: Colors.white70,
      ),
      onPressed: onpressed,
    );
  }
}
