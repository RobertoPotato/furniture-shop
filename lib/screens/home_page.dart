import 'package:flutter/material.dart';
import 'package:woody/components/category_component.dart';
import 'package:woody/components/my_spacer.dart';
import 'package:woody/components/product_component.dart';
import 'package:woody/data/category_data.dart';
import 'package:woody/data/product_data.dart';
import '../constants.dart';

Widget buildHomePage() {
  var searchController = new TextEditingController();
  ScrollController _sliverScrollController = ScrollController();

  return (Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 12.0,
    ),
    child: CustomScrollView(
      controller: _sliverScrollController,
      slivers: [
        MySpacer(height: 25.0),

        /// Header title and search area
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Furniture Palace",
                  style: kAppTitleStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        elevation: 5,
                        shadowColor: kColBackGround,
                        child: TextField(
                          //focusNode: ,
                          decoration: InputDecoration(
                            //contentPadding: EdgeInsets.all(8.0),
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Icon(Icons.search_rounded),
                            ),
                            labelText: "Search for furniture",
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          controller: searchController,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Material(
                        color: kColDarkBrown,
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Icon(
                            Icons.filter_alt_rounded,
                            size: 34,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        MySpacer(height: 20.0),

        /// Flash Sale Area
        SliverToBoxAdapter(
          child: Text(
            "Flash Sale",
            style: kSectionTitles,
          ),
        ),
        MySpacer(height: 5.0),
        SliverToBoxAdapter(
          child: Card(
            elevation: 3,
            shadowColor: kColBackGround,
            color: kColDarkBrownAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: kFlashSaleText,
                                  children: <TextSpan>[
                                    TextSpan(text: "Upto "),
                                    TextSpan(
                                      text: "50% ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "discount on all leather furniture",
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Material(
                                color: kColBackGround,
                                borderRadius: BorderRadius.circular(5),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Offer ends in 5 days",
                                    style: kRedText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            "images/13-armchair-png-image.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        MySpacer(height: 20.0),

        /// Categories Area
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: kSectionTitles,
                  ),
                  Text(
                    "See All",
                    style: kSeeAll,
                  ),
                ],
              ),
            ],
          ),
        ),
        MySpacer(height: 5.0),
        SliverToBoxAdapter(
          child: Container(
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories == null ? 0 : categories.length,
              itemBuilder: (BuildContext context, int index) => CategoryItems(
                category: categories[index],
              ),
            ),
          ),
        ),
        MySpacer(height: 20.0),

        /// Best selling area
        SliverToBoxAdapter(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Selling",
                    style: kSectionTitles,
                  ),
                  Text(
                    "See All",
                    style: kSeeAll,
                  ),
                ],
              ),
            ],
          ),
        ),
        MySpacer(height: 5.0),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => ProductComponent(
              product: products[index],
            ),
            childCount: products == null ? 0 : products.length,
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250.0,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              mainAxisExtent: 290),
        ),
      ],
    ),
  ));
}
