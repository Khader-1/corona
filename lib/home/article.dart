// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/screens/loading.dart';
import 'package:webviewx/webviewx.dart';
// import 'package:http/http.dart' as http;
import 'news.dart';

import 'blue_button.dart';
import 'menu_link.dart';

class Article extends StatelessWidget {
  const Article({Key key}) : super(key: key);

  static const route = 'article';

  @override
  Widget build(BuildContext context) {
    final e =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            titleSpacing: 120,
            elevation: 50,
            shadowColor: Colors.white,
            backgroundColor: Colors.white,
            stretch: false,
            title: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Image.asset('assets/images/logo.png')),
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
            expandedHeight: 70,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Center(
                child: SizedBox(
                  width: 1110,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.hardEdge,
                                      height: 180,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 40,
                                              color: Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.08),
                                            ),
                                          ]),
                                      child: Hero(
                                        tag: e['image'],
                                        child: Image.network(
                                          e['image'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    Text((e['title'] as String),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20,
                                            height: 1.6)),
                                    const SizedBox(height: 8),
                                    WebViewX(
                                      initialSourceType: SourceType.HTML,
                                      initialContent: e['subject'],
                                      height: 1700,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container()),
                    ],
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
