import 'package:flutter/material.dart';

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
        color: Colors.grey[800],
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
      splashColor: Color(0xff222122),
      icon: Icon(
        icon,
        size: size,
        color: Colors.white70,
      ),
      onPressed: onpressed,
    );
  }
}
