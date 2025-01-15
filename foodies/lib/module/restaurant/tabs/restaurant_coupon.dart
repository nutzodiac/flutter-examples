import 'package:flutter/material.dart';

import '../../../components/text/textlabel.dart';

class RestaurantCoupon extends StatefulWidget {
  const RestaurantCoupon({super.key});

  @override
  State<RestaurantCoupon> createState() => _RestaurantCouponState();
}

class _RestaurantCouponState extends State<RestaurantCoupon> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Textlabel.custom(
              text: "Coupon",
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            )
          ),
        ],
      ),
    );
  }
}