import 'package:flutter/material.dart';

//ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  static String routeName = "/detail";

  dynamic newsItem;

  DetailScreen({
    super.key,
    this.newsItem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade700,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container()
          ],
        ),
      ),
    );
  }
}
