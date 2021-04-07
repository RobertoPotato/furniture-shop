import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewComponent extends StatelessWidget {
  final String name;
  final String content;
  final double rating;

  const ReviewComponent(
      {Key key,
      @required this.name,
      @required this.content,
      @required this.rating})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      leading: CircleAvatar(
        child: Text(
          name[0].toString().toUpperCase(),
        ),
      ),
      subtitle: Text(
        content,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        Get.defaultDialog(
          title: name + " " + rating.toString(),
          middleText: content,
        );
      },
    );
  }
}
