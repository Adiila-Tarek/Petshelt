import 'package:flutter/material.dart';

class sheltersScreen extends StatelessWidget {
  static const String routeName = "sheltersScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shelters',
            style: TextStyle(
                fontFamily: 'inter', fontSize: 30, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 14, bottom: 14),
              child: Center(
                child: Text('Pet Shelters You’ll Find',
                    style: TextStyle(
                        fontFamily: 'inter/fonts/Inter-Regular.ttf',
                        fontSize: 24,
                        color: Colors.black)),
              ),
            ),
            Evac(),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Esma(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Hope(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Cart(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Spare(),
            )
          ],
        ),
      ),
    );
  }
}

class Evac extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFC5E1D0),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('EVAC',
                    style: TextStyle(
                        fontFamily: 'inter/fonts/Inter-SemiBold.ttf',
                        fontSize: 24,
                        color: Color(0xFFF76937),
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(children: [
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: "inter/fonts/Inter-Regular.ttf",
                            color: Colors.black),
                        children: <TextSpan>[
                      TextSpan(
                          text: 'Phone Number: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: '02 25174154'),
                    ]))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: "inter/fonts/Inter-Regular.ttf",
                              color: Colors.black),
                          children: <TextSpan>[
                        TextSpan(
                            text: 'Email: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'info@evac-egypt.org'),
                      ]))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: "inter/fonts/Inter-Regular.ttf",
                              color: Colors.black),
                          children: <TextSpan>[
                        TextSpan(
                            text: 'Location: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                'Autostrad road, Behind Police \nAcademy,Tora- Cairo'),
                      ]))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Esma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFC5E1D0),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('ESMA',
                    style: TextStyle(
                        fontFamily: 'inter/fonts/Inter-SemiBold.ttf',
                        fontSize: 24,
                        color: Color(0xFFF76937),
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(children: [
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: "inter/fonts/Inter-Regular.ttf",
                            color: Colors.black),
                        children: <TextSpan>[
                      TextSpan(
                          text: 'Phone Number: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: '01222188823'),
                    ]))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: "inter/fonts/Inter-Regular.ttf",
                              color: Colors.black),
                          children: <TextSpan>[
                        TextSpan(
                            text: 'Email: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'Mona@esmaegypt.org'),
                      ]))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                        text: const TextSpan(
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: "inter/fonts/Inter-Regular.ttf",
                                color: Colors.black),
                            children: <TextSpan>[
                          TextSpan(
                              text: 'Location: ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'Al Mansoureya Rd, Nazlet Al Ashtar, \nGiza'),
                        ])),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Hope extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFC5E1D0),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('HOPE',
                    style: TextStyle(
                        fontFamily: 'inter/fonts/Inter-SemiBold.ttf',
                        fontSize: 24,
                        color: Color(0xFFF76937),
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(children: [
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: "inter/fonts/Inter-Regular.ttf",
                            color: Colors.black),
                        children: <TextSpan>[
                      TextSpan(
                          text: 'Phone Number: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: '01006678878'),
                    ]))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: "inter/fonts/Inter-Regular.ttf",
                              color: Colors.black),
                          children: <TextSpan>[
                        TextSpan(
                            text: 'Email: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'info@hope-rescue.com'),
                      ]))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: "inter/fonts/Inter-Regular.ttf",
                              color: Colors.black),
                          children: <TextSpan>[
                        TextSpan(
                            text: 'Location: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'After Abu Sir Pyramid'),
                      ]))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFC5E1D0),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('CART',
                    style: TextStyle(
                        fontFamily: 'inter/fonts/Inter-SemiBold.ttf',
                        fontSize: 24,
                        color: Color(0xFFF76937),
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(children: [
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: "inter/fonts/Inter-Regular.ttf",
                            color: Colors.black),
                        children: <TextSpan>[
                      TextSpan(
                          text: 'Phone Number: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: '01061611870'),
                    ]))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: "inter/fonts/Inter-Regular.ttf",
                              color: Colors.black),
                          children: <TextSpan>[
                        TextSpan(
                            text: 'Email: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'Cartegypt.offcial@gmail.com'),
                      ]))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                        text: const TextSpan(
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: "inter/fonts/Inter-Regular.ttf",
                                color: Colors.black),
                            children: <TextSpan>[
                          TextSpan(
                              text: 'Location: ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  'CART Dog Shelter Abu Sir,Al Badrashin,\nGiza'),
                        ])),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Spare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFC5E1D0),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('S.P.A.R.E',
                    style: TextStyle(
                        fontFamily: 'inter/fonts/Inter-SemiBold.ttf',
                        fontSize: 24,
                        color: Color(0xFFF76937),
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(children: [
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: "inter/fonts/Inter-Regular.ttf",
                            color: Colors.black),
                        children: <TextSpan>[
                      TextSpan(
                          text: 'Phone Number: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: '01223162912'),
                    ]))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: "inter/fonts/Inter-Regular.ttf",
                              color: Colors.black),
                          children: <TextSpan>[
                        TextSpan(
                            text: 'Email: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'info@sparelives.org'),
                      ]))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                        text: const TextSpan(
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: "inter/fonts/Inter-Regular.ttf",
                                color: Colors.black),
                            children: <TextSpan>[
                          TextSpan(
                              text: 'Location: ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'Zamalek,16 Taha Hussein Street,Cairo'),
                        ])),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
