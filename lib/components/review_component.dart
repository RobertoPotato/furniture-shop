import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woody/constants.dart';
import 'package:woody/models/review_model.dart';

class ReviewComponent extends StatelessWidget {
  final Review review;

  const ReviewComponent({Key key, @required this.review}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(review.name),
      leading: CircleAvatar(
        radius: 17.5,
        backgroundColor: kColDarkBrown,
        child: Text(
          review.name[0].toString().toUpperCase(),
          style: kHeadingStyle.copyWith(
            color: kColBackGround,
          ),
        ),
      ),
      subtitle: Text(
        review.content,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        Get.defaultDialog(
          title: review.name + " " + review.rating.toString(),
          middleText: review.content,
        );
      },
    );
  }
}
