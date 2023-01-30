import 'package:cs_project/common/CustomWidgets.dart';
import 'package:cs_project/screens/caesar/CaesarFormText.dart';
import 'package:cs_project/screens/caesar/CaesarFile.dart';
import 'package:cs_project/screens/home/home.dart';
import 'package:cs_project/screens/playfair/custom_tap_bar.dart';
import 'package:cs_project/screens/playfair/playfair.dart';
import 'package:cs_project/screens/playfair/playfair_file.dart';
import 'package:flutter/material.dart';

class PlayfairHome extends StatefulWidget {
  const PlayfairHome({Key? key}) : super(key: key);

  @override
  State<PlayfairHome> createState() => _PlayfairHomeState();
}

class _PlayfairHomeState extends State<PlayfairHome>
    with SingleTickerProviderStateMixin {
  int currentindex = 0;
  final Controller = PageController(initialPage: 1);
  List<Widget> get screens => [
        playfairFormText(),
        PlayfairFile(),
      ];
  List<String> titles = [
    'P l a y F a i r - Text Form',
    'P l a y F a i r - Text File',
  ];
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(initialIndex: 0, vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.blue.withOpacity(.5),
          elevation: 10,
          title: Text(
            "Playfair",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                nextScreenReplace(context, const Home());
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          bottom: new TabBar(
            controller: _tabController,
            tabs: <Widget>[
              new Tab(
                text: 'P l a y F a i r - Text Form',
              ),
              new Tab(
                text:'P l a y F a i r - Text File',

              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            new playfairFormText(),
            new PlayfairFile(),
          ],
        ),
      ),
    );
  }
}
