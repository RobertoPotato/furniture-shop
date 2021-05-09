import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:woody/components/credits_component.dart';
import 'package:woody/constants.dart';

Future<void> _launchWebUrl(String url) async {
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

class CreditsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kColBackGround,
        body: Padding(
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
                    "Credits",
                    style: kAppTitleStyle,
                  ),
                ),
                CreditsComponent(
                  title: "Designed by",
                  contentChild: PersonCredit(
                    name: "Jane Waitara",
                    linkedInAddress:
                        "https://www.linkedin.com/in/jane-waitara/",
                  ),
                ),
                CreditsComponent(
                  title: "Built by",
                  contentChild: PersonCredit(
                    name: "Robert Wabuti",
                    linkedInAddress:
                        "https://www.linkedin.com/in/robert-wabuti/",
                  ),
                ),
                CreditsComponent(
                  title: "Assets",
                  contentChild: Column(
                    children: [
                      CreditText(
                        publisher: "Freepik",
                        publisherUrl: "https://www.freepik.com",
                        isIcon: true,
                      ),
                      CreditText(
                        publisher: "Pixel perfect",
                        publisherUrl:
                            "https://www.flaticon.com/authors/pixel-perfect",
                        isIcon: true,
                      ),
                      CreditText(
                        publisher: "xnimrodx",
                        publisherUrl:
                            "https://www.flaticon.com/authors/xnimrodx",
                        isIcon: true,
                      ),
                      CreditText(
                        publisher: "srip",
                        publisherUrl: "https://www.flaticon.com/authors/srip",
                        isIcon: true,
                      ),
                      CreditText(
                        publisher: "smalllikeart",
                        publisherUrl:
                            "https://www.flaticon.com/authors/smalllikeart",
                        isIcon: true,
                      ),
                      CreditText(
                        title: "Furniture images ",
                        publisher: "FreePNGimg.com",
                        publisherUrl: "https://freepngimg.com/furniture",
                        isIcon: false,
                      ),
                      CreditText(
                        title: "App Icon ",
                        publisher: "Klipartz",
                        publisherUrl:
                            "https://www.klipartz.com/en/sticker-png-rwvxy",
                        isIcon: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
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
          GestureDetector(
            onTap: () {
              _launchWebUrl(this.linkedInAddress);
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

class CreditText extends StatelessWidget {
  final String publisher;
  final String publisherUrl;
  final String title;
  final bool isIcon;

  const CreditText({
    Key key,
    @required this.publisher,
    @required this.publisherUrl,
    @required this.isIcon,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: this.isIcon
          ? RichText(
              text: TextSpan(
                style: kGreyText.copyWith(fontSize: 20.0),
                children: <TextSpan>[
                  TextSpan(text: "Icon made by "),
                  TextSpan(
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        _launchWebUrl(this.publisherUrl);
                      },
                    text: "$publisher ",
                  ),
                  TextSpan(
                    text: "from ",
                  ),
                  TextSpan(
                    text: "www.flaticon.com",
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        _launchWebUrl("https://www.flaticon.com/");
                      },
                  ),
                ],
              ),
            )
          : RichText(
              text: TextSpan(
                style: kGreyText.copyWith(fontSize: 20.0),
                children: <TextSpan>[
                  TextSpan(
                    text: this.title,
                  ),
                  TextSpan(
                    text: "from ",
                  ),
                  TextSpan(
                    text: this.publisher,
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        _launchWebUrl(this.publisherUrl);
                      },
                  ),
                ],
              ),
            ),
    );
  }
}
