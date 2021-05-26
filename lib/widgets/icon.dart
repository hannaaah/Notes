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
        color: Colors.grey[800],
        shape: CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            size: 35,
            color: Colors.white60,
          ),
        ),
      ),
    );
  }
}
