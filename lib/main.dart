import 'package:flutter/material.dart';
import 'package:flutter_app/screens/loading.dart';

import 'dart:math';


import 'home/about.dart';
import 'home/article.dart';
import 'home/blue_button.dart';
import 'home/home.dart';
import 'home/menu_link.dart';
import 'home/news.dart';
import 'home/prevention.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kovid-19',
      theme: ThemeData(
        primaryColor: const Color(0xff2a81ea),
        scaffoldBackgroundColor: const Color(0xfff7f9fe),
      ),
      home: const HomePage(),
      routes: {Article.route: (context) => const Article()},
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ScrollController();

  var color = Colors.transparent;
  double elevation = 0;

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      if (controller.offset < 200) {
        setState(() {
          color = Colors.white.withOpacity(min(controller.offset / 100, 1));
          elevation = min(max(0, controller.offset - 150), 50);
        });
      }
    });
    return Scaffold(
      body: CustomScrollView(
        controller: controller,
        slivers: [
          SliverAppBar(
            titleSpacing: 120,
            elevation: elevation,
            shadowColor: Colors.white,
            backgroundColor: color,
            stretch: false,
            title: Image.asset('assets/images/logo.png'),
            actions: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const MenuLink(
                      'Home',
                      isActive: true,
                    ),
                    const MenuLink('About Corona'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: TextButton(onPressed:() {
                        Navigator.push(context, MaterialPageRoute(builder:(context) => LoadingScreen()),);
                      },
                        child: Text("Corona Injuries",
                          style:TextStyle(fontWeight: FontWeight.bold, fontSize: 16,
                              color: Colors.black
                          ) ,

                        ),),
                    ),
                    const MenuLink('Prevention'),
                    const MenuLink('Treatment'),
                    const MenuLink('FAQ'),
                    const MenuLink('News'),
                    const MenuLink('More'),
                    BlueButton(
                      child: const Text('Do & Don’t'),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 120),
                  ],
                ),
              )
            ],
            pinned: true,
            collapsedHeight: 70,
            expandedHeight: 100,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const Home(),
              const About(),
              const Prevention(),
              const News(),
            ]),
          )
        ],
      ),
    );
  }
}
