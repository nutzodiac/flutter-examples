import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../components/text/textlabel.dart';
import '../../../components/toolbar/restaurantbar.dart';
import '../tabs/restaurant_coupon.dart';
import '../tabs/restaurant_gallery.dart';
import '../tabs/restaurant_map.dart';
import '../tabs/restaurant_menu.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> with TickerProviderStateMixin {

  late final TabController _tabController;
  final GlobalKey _appbarKey = GlobalKey();
  final GlobalKey _tabbarKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.75,
              padding: const EdgeInsets.all(20.0),
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  RestaurantMenu(),
                  RestaurantCoupon(),
                  RestaurantGallery(),
                  RestaurantMap(),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 0.0),
                    decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage('assets/images/header_restaurant.jpeg'), fit: BoxFit.fitWidth),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              padding: EdgeInsets.all(0.0),
                              icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: SvgPicture.asset(
                                    'assets/icons/share_black.svg',
                                    width: 24,
                                    height: 24,
                                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                    fit: BoxFit.contain,
                                  )
                                ),
                                SvgPicture.asset(
                                  'assets/icons/heart_outline.svg',
                                  width: 24,
                                  height: 24,
                                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                  fit: BoxFit.contain,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Textlabel.custom(
                            text: 'TOKI ITALIAN',
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 26,
                          ),
                        ),
                      ],
                    )
                  ),
                ],
              ),
              Container(
                key: _tabbarKey,
                padding: EdgeInsets.only(top: 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                ),
                child: PreferredSize(
                  preferredSize: const Size.fromWidth(double.infinity),
                  child: Container(
                    padding: EdgeInsets.all(0.0),
                    child: RestaurantBarWidget(controller: _tabController),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
