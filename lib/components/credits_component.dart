import 'package:flutter/material.dart';
import 'package:getwidget/components/accordian/gf_accordian.dart';

import '../constants.dart';

class CreditsComponent extends StatelessWidget {
  final String title;
  final Widget contentChild;

  const CreditsComponent({
    Key key,
    @required this.title,
    @required this.contentChild,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GFAccordion(
      title: this.title,
      contentChild: contentChild,
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
