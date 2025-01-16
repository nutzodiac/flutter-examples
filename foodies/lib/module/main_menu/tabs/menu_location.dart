import 'package:flutter/material.dart';
import 'package:foodies/routes/routes.dart';

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
    return Padding(
      padding: const EdgeInsets.only(bottom: 60.0),
      child: CustomScrollView(
        slivers: <Widget>[
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: SliverAppBar(
              pinned: true,
              primary: true,
              titleSpacing: 0,
              expandedHeight: 0.0,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                title: Textlabel.custom(
                  text: 'Location',
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                titlePadding: EdgeInsetsDirectional.only(
                  start: 5.0,
                  bottom: 20.0,
                  top: 0.0
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(Routes.restaurant),
                  child: Card(
                    color: Colors.white,
                    shadowColor: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
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
                  ),
                );
              },
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}