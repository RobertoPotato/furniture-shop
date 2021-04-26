import 'package:flutter/material.dart';
import 'package:woody/constants.dart';

Widget buildHelpPage() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Column(
      children: [
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
            bottom: 5,
          ),
          child: Text(
            "Help",
            style: kAppTitleStyle,
          ),
        ),
      ],
    ),
  );
}
