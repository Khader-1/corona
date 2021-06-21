import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About the disease',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 24,
                    ),
                  ),
                  const Text(
                    'Coronavirus (COVID-19)',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '''COVID-19 is a new illness that can affect your lungs and airways. It's caused by a virus called coronavirus. It was discovered in December 2019 in Wuhan, Hubei, China.
Common signs of infection include respiratory symptoms, fever, cough, shortness of breath and breathing difficulties. In more severe cases, infection can cause pneumonia, severe acute respiratory syndrome, kidney failure and even death.
Standard recommendations to prevent infection spread include regular hand washing, covering mouth and nose when coughing and sneezing, thoroughly cooking meat and eggs. Avoid close contact with anyone showing symptoms of respiratory illness such as coughing and sneezing.
''',
                    softWrap: true,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black54,
                        fontSize: 16,
                        height: 1.6),
                  )
                ],
              ),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 348,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      blurRadius: 40,
                      color: Theme.of(context).primaryColor.withOpacity(0.08),
                    ),
                  ]),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const ListTile(
                        title: Text(
                          'What you need to know',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const Divider(),
                      ListTile(
                          trailing: Icon(Icons.arrow_forward,
                              color: Theme.of(context).primaryColor),
                          title: Text(
                            'How coronavirus is spread',
                            style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor),
                          )),
                      const Divider(),
                      ListTile(
                          trailing: Icon(Icons.arrow_forward,
                              color: Theme.of(context).primaryColor),
                          title: Text(
                            'Symptoms of coronavirus',
                            style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor),
                          )),
                      const Divider(),
                      ListTile(
                          trailing: Icon(Icons.arrow_forward,
                              color: Theme.of(context).primaryColor),
                          title: Text(
                            'How to protect yourself',
                            style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor),
                          )),
                      const Divider(),
                      ListTile(
                          trailing: Icon(Icons.arrow_forward,
                              color: Theme.of(context).primaryColor),
                          title: Text(
                            'Treatment for coronavirus',
                            style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor),
                          )),
                      const Divider(),
                      ListTile(
                          trailing: Icon(Icons.arrow_forward,
                              color: Theme.of(context).primaryColor),
                          title: Text(
                            'Myth-Busters of coronavirus',
                            style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor),
                          )),
                      const Divider(),
                      ListTile(
                          trailing: Icon(Icons.arrow_forward,
                              color: Theme.of(context).primaryColor),
                          title: Text(
                            'Questions & answers',
                            style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor),
                          )),
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
