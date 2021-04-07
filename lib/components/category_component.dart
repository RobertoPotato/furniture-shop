import 'package:flutter/material.dart';
import 'package:woody/constants.dart';

class CategoryItems extends StatelessWidget {
  final String image;
  final String title;

  const CategoryItems({Key key, this.image, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shadowColor: kColBackGround,
      child: Container(
        height: 80.0,
        width: 90.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
                height: 60,
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
