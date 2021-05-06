import 'package:flutter/material.dart';
import 'package:woody/components/help_categories.dart';
import 'package:woody/components/my_spacer.dart';
import 'package:woody/constants.dart';
import 'package:woody/data/category_data.dart';
import 'package:woody/data/how_to_data.dart';
import 'package:woody/models/how_to_model.dart';

Widget buildHelpPage() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: CustomScrollView(
      slivers: [
        MySpacer(height: 25.0),
        SliverToBoxAdapter(
          child: Padding(
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
        ),
        MySpacer(height: 20.0),
        SliverToBoxAdapter(
          child: Container(
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories == null ? 0 : categories.length,
              itemBuilder: (BuildContext context, int index) =>
                  HelpCategoryItems(
                category: categories[index],
              ),
            ),
          ),
        ),
        MySpacer(height: 20.0),
        SliverToBoxAdapter(
          child: Text(
            "Buying Guides",
            style: kSectionTitles,
          ),
        ),
        MySpacer(height: 10.0),
        SliverToBoxAdapter(
          child: BuyingGuideComponent(),
        ),
        MySpacer(height: 20.0),
        SliverToBoxAdapter(
          child: Text(
            "How Tos",
            style: kSectionTitles,
          ),
        ),
        MySpacer(height: 10.0),
        SliverToBoxAdapter(
          child: Container(
            height: 150.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: howTos == null ? 0 : howTos.length,
              itemBuilder: (BuildContext context, int index) => HowToComponent(
                data: howTos[index],
              ),
            ),
          ),
        )
      ],
    ),
  );
}

class HowToComponent extends StatelessWidget {
  final HowTo data;
  const HowToComponent({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 210.0,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Image.asset(
                  data.assetUrl,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  data.title,
                  style: kHeadingStyle.copyWith(fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time_sharp,
                      color: kColGrey,
                      size: 16,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "${data.minutes} Minute read",
                      style: kGreyText.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuyingGuideComponent extends StatelessWidget {
  const BuyingGuideComponent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage("images/4-sofa-png-image.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Container(),
        ),
        Positioned(
          left: 12.0,
          bottom: 5.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0),
              Text(
                "Buying a new sofa",
                style: kHeadingStyle.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time_sharp,
                    color: kColGrey,
                    size: 16,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "7 Minute read",
                    style: kGreyText.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
