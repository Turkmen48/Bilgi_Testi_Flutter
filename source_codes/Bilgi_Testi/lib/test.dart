import 'package:flutter/material.dart';

class StatmentExample extends StatelessWidget {
  Widget build(BuildContext context) {
    return Text(
      (() {
        if (true) {
          return "tis true";
        }

        return "anything but true";
      })(),
    );
  }
}
