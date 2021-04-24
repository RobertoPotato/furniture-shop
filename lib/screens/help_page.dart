import 'package:flutter/material.dart';
import 'package:woody/components/credits_component.dart';
import 'package:woody/components/help_component.dart';
import 'package:woody/constants.dart';

Widget buildHelpPage() {
  return SingleChildScrollView(
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
        HelpComponent(title: "Add to Cart"),
        HelpComponent(title: "Remove from cart"),
        HelpComponent(title: "Check amount due"),
        HelpComponent(title: "View product details"),
        HelpComponent(title: "Search by category"),
        HelpComponent(title: "Read your reviews"),
        CreditsComponent(
          title: "Designed by",
          contentChild: PersonCredit(
            name: "This name",
            linkedInAddress: "bleh",
          ),
        ),
        CreditsComponent(
          title: "Built by",
          contentChild: PersonCredit(
            name: "This name",
            linkedInAddress: "bleh",
          ),
        ),
        CreditsComponent(
          title: "Assets from",
          contentChild: Container(
            child: Text("Person's Name"),
          ),
        ),
      ],
    ),
  );
}

class PersonCredit extends StatelessWidget {
  final String name;
  final String linkedInAddress;

  const PersonCredit({
    Key key,
    @required this.name,
    @required this.linkedInAddress,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            this.name,
            style: kGreyText.copyWith(fontSize: 24),
          ),
          Image.asset(
            "images/linkedin.png",
            width: 34,
            height: 34,
          ),
        ],
      ),
    );
  }
}
