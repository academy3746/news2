import 'package:flutter/material.dart';
import 'package:news2/constants/sizes.dart';
import 'package:news2/features/widgets/date_format.dart';

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
        title: Text(
          newsItem["title"],
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// urlToImage
              SizedBox(
                height: Sizes.size250,
                width: double.infinity,
                child: newsItem["urlToImage"] != null &&
                        newsItem["urlToImage"] != ""
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(Sizes.size10),
                        child: Image.network(
                          newsItem["urlToImage"],
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(Sizes.size10),
                        child: Image.asset("assets/images/no_image.png"),
                      ),
              ),

              /// title
              Container(
                margin: const EdgeInsets.only(
                  top: Sizes.size32,
                ),
                child: Text(
                  newsItem["title"],
                  style: const TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              /// publishedAt
              Container(
                margin: const EdgeInsets.only(
                  bottom: Sizes.size20,
                  right: Sizes.size12,
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    formatDate(newsItem["publishedAt"]),
                    style: const TextStyle(fontSize: Sizes.size12),
                  ),
                ),
              ),

              /// description
              newsItem["description"] != null && newsItem["description"] != ""
                  ? Text(newsItem["description"])
                  : const Text("기사 내용이 없습니다."),
            ],
          ),
        ),
      ),
    );
  }
}
