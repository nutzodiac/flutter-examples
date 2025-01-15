import 'package:flutter/material.dart';

import '../../../components/text/textlabel.dart';

class RestaurantMenu extends StatefulWidget {
  const RestaurantMenu({super.key});

  @override
  State<RestaurantMenu> createState() => _RestaurantMenuState();
}

class _RestaurantMenuState extends State<RestaurantMenu> {

  List items = [
    {
      "title":"Sweet potato fries",
      "amount": "5",
      "image": "pexels-photo-1893556.jpeg"
    },
    {
      "title":"French fries",
      "amount": "5",
      "image": "pexels-photo-1583884.jpeg"
    },
    {
      "title":"Chicken wings",
      "amount": "5",
      "image": "pexels-photo-2338407.jpeg"
    },
    {
      "title":"Pumpkhin soup",
      "amount": "5",
      "image": "pexels-photo-1277483.jpeg"
    },
    {
      "title":"Stir Fried Spicy Spaghetti",
      "amount": "5",
      "image": "pexels-photo-2092906.jpeg"
    },
    {
      "title":"Spaghetti Tomato Sauce",
      "amount": "5",
      "image": "pexels-photo-2059192.jpeg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.6)),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                shadowColor: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset('assets/images/${items[index]['image']}', fit: BoxFit.fitHeight),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        children: [
                          Textlabel.custom(
                            text: '${items[index]['title']}',
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                          Textlabel.custom(
                            text: '\$${items[index]['amount']}',
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}