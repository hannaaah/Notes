import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final icon;
  final Function onpressed;

  IconWidget({this.icon, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: RaisedButton(
        onPressed: onpressed,
        color: Color(0xff626263),
        elevation: 15,
        shape: CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            icon,
            size: 40,
            color: Colors.white60,
          ),
        ),
      ),
    );
  }
}
