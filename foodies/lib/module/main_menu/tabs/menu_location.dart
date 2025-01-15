import 'package:flutter/material.dart';

import '../../../components/text/textlabel.dart';

class MenuLocation extends StatefulWidget {
  const MenuLocation({super.key});

  @override
  State<MenuLocation> createState() => _MenuLocationState();
}

class _MenuLocationState extends State<MenuLocation> {

  List items = [
    {
      "title":"Toki Italian",
      "address":"9 World Square 644 George St.Sydney",
      "distance": "10km",
      "image": "photo-1498654896293-37aacf113fd9.jpeg"
    },
    {
      "title":"Italian blow",
      "address":"39 Newtown square Kings Sti, Newtom",
      "distance": "20km",
      "image": "photo-1522336572468-97b06e8ef143.jpeg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Textlabel.custom(
              text: "Location",
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            )
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.white,
                shadowColor: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset('assets/images/${items[index]['image']}', fit: BoxFit.fitWidth),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Textlabel.custom(
                              text: '${items[index]['title']}',
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                WidgetSpan(
                                  child: Textlabel.custom(
                                    text: '${items[index]['address']}',
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade800,
                                    fontSize: 15,
                                  ),
                                ),
                                WidgetSpan(
                                  child: Textlabel.custom(
                                    text: '${items[index]['distance']}',
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade800,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}