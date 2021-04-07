import 'package:flutter/material.dart';
import 'constants.dart';
import 'components/category_component.dart';
import 'package:woody/components/product_component.dart';
import 'components/product_component.dart';
import 'data/product_data.dart';
import 'data/category_data.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var searchController = new TextEditingController();
  ScrollController sliverScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kColBackGround,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          child: CustomScrollView(
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
                      SizedBox(height: 20,),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
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
                                            text:
                                                "discount on all leather furniture",
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
                    itemBuilder: (BuildContext context, int index) =>
                        CategoryItems(
                      title: categories[index].title,
                      image: categories[index].image,
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
                      imageUrl: products[index].imageUrl,
                      title: products[index].title,
                      description: products[index].description,
                      price: products[index].price,
                      stock: products[index].stock),
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
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: kColDarkBrown,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined, color: kColDarkBrown),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined, color: kColDarkBrown,),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded, color: kColDarkBrown,),
              label: 'Account',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help_outline_outlined, color: kColDarkBrown,),
              label: 'Help',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kColDarkBrown,
          unselectedItemColor: kColDarkBrown,
          //currentIndex: _selectedIndex,
          //selectedItemColor: Colors.amber[800],
          //onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class MySpacer extends StatelessWidget {
  final height;

  const MySpacer({Key key, @required this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
      ),
    );
  }
}
