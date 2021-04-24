import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:woody/components/credits_component.dart';
import 'package:woody/components/help_component.dart';
import 'package:woody/constants.dart';

Widget buildHelpPage() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          CreditsComponent(
            title: "Designed by",
            contentChild: PersonCredit(
              name: "Jane Waitara",
              linkedInAddress: "https://www.linkedin.com/in/jane-waitara/",
            ),
          ),
          CreditsComponent(
            title: "Built by",
            contentChild: PersonCredit(
              name: "Robert Wabuti",
              linkedInAddress: "https://www.linkedin.com/in/robert-wabuti/",
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

  Future<void> _launchLinkedInWeb(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        enableJavaScript: true,
      );
    } else {
      Get.snackbar(
        "Error",
        "Couldn't launch $url",
        backgroundColor: kColBackGround,
      );
      throw "Couldn't launch $url";
    }
  }

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
          GestureDetector(
            onTap: () {
              _launchLinkedInWeb(this.linkedInAddress);
            },
            child: Image.asset(
              "images/linkedin.png",
              width: 34,
              height: 34,
            ),
          ),
        ],
      ),
    );
  }
}
