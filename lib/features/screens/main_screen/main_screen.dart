import 'package:flutter/material.dart';
import 'package:news2/features/widgets/back_action_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static String routeName = "/main";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /// Exit Application with double touch on Android
  late BackHandlerButton _backHandlerButton;

  @override
  void initState() {
    super.initState();

    _backHandlerButton = BackHandlerButton(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _backHandlerButton.onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Container(),
      ),
    );
  }
}
