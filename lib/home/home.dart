import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'blue_button.dart';
import 'menu_link.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final future = http.get(Uri.parse('https://corona.lmao.ninja/v2/all/'));
    return Stack(
      children: [
        Image.asset('assets/images/shape-a.png', width: double.infinity),
        Center(
          child: SizedBox(
            width: 1110,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('CORONA',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(
                                    fontSize: 64,
                                    fontWeight: FontWeight.w900,
                                  )),
                          Column(
                            children: [
                              Text('COVID-19',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      .copyWith(
                                        color: Theme.of(context).errorColor,
                                        fontSize: 21,
                                        fontWeight: FontWeight.w900,
                                      )),
                              Text('VIRUS',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      .copyWith(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w900,
                                      )),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'The Coronavirus (COVID-19) was first reported in Wuhan, Hubei, China in December 2019, the outbreak was later recognized as a pandemic by the World Health Organization (WHO) on 11 March 2020.',
                        style: TextStyle(
                          height: 1.6,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          BlueButton(
                              child: Row(
                                children: const [
                                  Text(
                                    'How to Protect',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.shield_outlined,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              onPressed: () {}),
                          const SizedBox(width: 36),
                          const MenuLink(
                            'About Covid-19',
                            isActive: true,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Theme.of(context).primaryColor,
                          )
                        ],
                      ),
                      const SizedBox(height: 24),
                      FutureBuilder<http.Response>(
                          initialData: http.Response(
                              '{"cases":0,"deaths":0,"recoverd":0}', 200),
                          future: future,
                          builder: (context, snapshot) {
                            final res = json.decode(snapshot.data?.body ?? '')
                                as Map<String, dynamic>;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      'Worldwide Cases',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      res['cases'].toString(),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      'Deaths',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      res['deaths'].toString(),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      'Recovered',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      res['recovered'].toString(),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            '* Last updated: Jun 17, 2021, 08:52 AM America/Chicago',
                            style: TextStyle(color: Colors.black38),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Image.asset('assets/images/header-a.png'),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
