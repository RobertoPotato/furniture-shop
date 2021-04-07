import 'package:flutter/material.dart';

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
