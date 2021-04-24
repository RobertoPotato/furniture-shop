import 'package:flutter/material.dart';
import 'package:getwidget/components/accordian/gf_accordian.dart';

import '../constants.dart';

const kLorem =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.";

class HelpComponent extends StatelessWidget {
  final String title;
  final String content;

  const HelpComponent({
    Key key,
    @required this.title,
    this.content,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GFAccordion(
      title: this.title,
      content: kLorem,
      collapsedIcon: Icon(Icons.keyboard_arrow_down_rounded),
      expandedIcon: Icon(Icons.close_rounded),
      expandedTitleBackgroundColor: kColDarkBrownAccent,
      titleBorderRadius: BorderRadius.circular(15),
      contentBorderRadius: BorderRadius.circular(15),
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
      titlePadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
      textStyle: kHeadingStyle,
    );
  }
}
