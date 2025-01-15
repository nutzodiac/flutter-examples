import 'package:flutter/material.dart';
import '../../../components/text/textlabel.dart';
import '../../../components/toolbar/tabbar.dart';
import '../tabs/menu_account.dart';
import '../tabs/menu_favourite.dart';
import '../tabs/menu_random.dart';
import '../tabs/menu_promotion.dart';
import '../tabs/menu_location.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});

  @override
  _MainMenuPageState createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> with TickerProviderStateMixin {

  late final TabController _tabController;
  final GlobalKey _tabbarKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg-color.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  MenuRandom(),
                  MenuPromotion(),
                  MenuLocation(),
                  MenuFavourite(),
                  MenuAccount(),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(image: AssetImage('assets/images/bg-color.png')),
                      ),
                    ),
                  ],
                ),
                Container(
                  key: _tabbarKey,
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom > 0 ? 25 : 0, top: 0.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  ),
                  child: PreferredSize(
                    preferredSize: const Size.fromWidth(double.infinity),
                    child: Container(
                      padding: EdgeInsets.all(0.0),
                      child: TabBarWidget(controller: _tabController),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
