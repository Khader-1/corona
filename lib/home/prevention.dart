import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Prevention extends StatelessWidget {
  const Prevention({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            http.get(Uri.parse('https://coranavirus.herokuapp.com/api/advice')),
        builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
          if (snapshot.hasData) {
            final list = json.decode(snapshot.data?.body ?? '') as List;
            final casted = list.cast<Map<String, dynamic>>();
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 120),
              alignment: Alignment.center,
              child: SizedBox(
                width: 1110,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'How to Protect Yourself?',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 24,
                            ),
                          ),
                          const Text(
                            'Prevention & advice',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 32,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(
                            width: 800,
                            child: Text(
                              '''There is currently no vaccine to prevent coronavirus disease 2019 (COVID-19). The best way to prevent illness is to avoid being exposed to this virus. Stay aware of the latest information on the COVID-19 outbreak, available on the WHO website and through your national and local public health authority.''',
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black54,
                                  fontSize: 16,
                                  height: 1.6),
                            ),
                          ),
                          const SizedBox(height: 64),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: casted
                                  .map(
                                    (e) => Expanded(
                                        child: Column(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              clipBehavior: Clip.hardEdge,
                                              height: 120,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(60),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 40,
                                                      color: Theme.of(context)
                                                          .primaryColor
                                                          .withOpacity(0.08),
                                                    ),
                                                  ]),
                                              child: Image.network(e['image']),
                                            ),
                                            const SizedBox(height: 24),
                                            Text(e['headline'],
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    // color: Colors.black54,
                                                    fontSize: 20,
                                                    height: 1.6)),
                                            const SizedBox(height: 8),
                                            Text(
                                                (e['subtitle'] as String)
                                                    .trim()
                                                    .substring(0, 100),
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.black54,
                                                    fontSize: 16,
                                                    height: 1.6))
                                          ],
                                        )
                                      ],
                                    )),
                                  )
                                  .toList()),
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
