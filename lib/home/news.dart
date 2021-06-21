import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/home/article.dart';
import 'package:http/http.dart' as http;

class News extends StatelessWidget {
  const News({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: http
            .get(Uri.parse('https://coranavirus.herokuapp.com/api/article')),
        builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
          if (snapshot.hasData) {
            final list = json.decode(snapshot.data?.body ?? '') as List;
            final casted = list.cast<Map<String, dynamic>>();
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 120),
              color: Colors.white,
              alignment: Alignment.center,
              child: SizedBox(
                width: 1110,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Recent From Blog',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 24,
                            ),
                          ),
                          const Text(
                            'Latest Update',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 32,
                            ),
                          ),
                          const SizedBox(height: 64),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: casted
                                .sublist(0, 3)
                                .map(
                                  (e) => Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        Article.route,
                                        arguments: e,
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Container(
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(4),
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
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
                                                      BorderRadius.circular(
                                                          4),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 40,
                                                          color:
                                                          Theme.of(context)
                                                              .primaryColor
                                                              .withOpacity(
                                                              0.08),
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
                                                Text(
                                                    (e['title'] as String)
                                                        .substring(0, 49),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                        FontWeight.w900,
                                                        // color: Colors.black54,
                                                        fontSize: 20,
                                                        height: 1.6)),
                                                const SizedBox(height: 8),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),
                            )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        });
  }
}
