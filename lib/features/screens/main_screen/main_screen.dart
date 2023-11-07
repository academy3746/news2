// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news2/constants/sizes.dart';
import 'package:news2/features/screens/detail_screen/detail_screen.dart';
import 'package:news2/features/widgets/back_action_button.dart';
import 'package:http/http.dart' as http;
import 'package:news2/features/widgets/date_format.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static String routeName = "/main";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /// Exit Application with double touch on Android
  late BackHandlerButton _backHandlerButton;

  /// Initialize API as array list
  List<dynamic> lstNewsInfo = [];

  Future<void> _getNewsInfo() async {
    const apiKey = "228e79b0edb94ac8af43a22e2bed6c50";
    const apiUrl =
        "https://newsapi.org/v2/top-headlines?country=kr&apiKey=$apiKey";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        setState(() {
          lstNewsInfo = responseData["articles"];
        });
      } else {
        throw Exception("Communication Failed: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();

    _backHandlerButton = BackHandlerButton(context: context);
    _getNewsInfo();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _backHandlerButton.onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(Sizes.size8),
            child: Image.asset("assets/images/splash.png"),
          ),
          title: const Text(
            "API NEW JEANS",
            style: TextStyle(
              color: Colors.white,
              fontSize: Sizes.size24,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 1,
          backgroundColor: Colors.grey.shade700,
        ),
        body: Padding(
          padding: const EdgeInsets.all(
            Sizes.size24,
          ),
          child: ListView.builder(
            itemCount: lstNewsInfo.length,
            itemBuilder: (BuildContext context, int index) {
              var newsItem = lstNewsInfo[index];

              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    DetailScreen.routeName,
                    arguments: newsItem,
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: Sizes.size30,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      /// urlToImage
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: newsItem["urlToImage"] != null &&
                                newsItem["urlToImage"] != ""
                            ? ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(Sizes.size10),
                                child: Image.network(
                                  newsItem["urlToImage"],
                                  fit: BoxFit.cover,
                                ),
                              )
                            : ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(Sizes.size10),
                                child:
                                    Image.asset("assets/images/no_image.png"),
                              ),
                      ),

                      /// Shadow Box UI
                      Container(
                        height: Sizes.size64,
                        width: double.infinity,
                        decoration: ShapeDecoration(
                          color: Colors.black.withOpacity(0.7),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(Sizes.size10),
                              bottomRight: Radius.circular(Sizes.size10),
                            ),
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(Sizes.size10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                newsItem["title"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: Sizes.size14,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// publishedAt
                      Container(
                        margin: const EdgeInsets.all(Sizes.size10),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            formatDate(newsItem["publishedAt"]),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
