import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/components/dialog/dialog_custom.dart';
import '../../../components/text/textlabel.dart';
import '../../../components/toolbar/tabbar.dart';
import '../widgets/mock_page_tab2.dart';
import '../widgets/mock_page_tab4.dart';


List<String> list = <String>['One', 'Two', 'Three', 'Four'];

enum SingingCharacter { lafayette, jefferson }

class MockPage extends StatefulWidget {
  final int? setTab;

  const MockPage({super.key, this.setTab});

  @override
  State<MockPage> createState() => _MockPageState();
}

class _MockPageState extends State<MockPage> with TickerProviderStateMixin, MyDialog {
  
  late final TabController _tabController;
  final GlobalKey _appbarKey = GlobalKey();
  final GlobalKey _tabbarKey = GlobalKey();

  double getHTab = 0.0;
  double getHApp = 0.0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: widget.setTab!);
    _tabController.addListener(() {
      context.go('/mock/${_tabController.index}');
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getSizes();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future _getSizes() async {
    final RenderBox renderBoxTab = _tabbarKey.currentContext!.findRenderObject() as RenderBox;
    final boxSizeTab = renderBoxTab.size;
    final RenderBox renderBoxApp = _appbarKey.currentContext!.findRenderObject() as RenderBox;
    final boxSizeApp = renderBoxApp.size;
    setState(() {
      getHTab = renderBoxTab.size.height;
      getHApp = renderBoxApp.size.height;
    });
    return [boxSizeTab, boxSizeApp];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: _appbarKey,
        automaticallyImplyLeading: false,
        excludeHeaderSemantics: true,
        title: Semantics(
          identifier: 'AppBar', 
          child: TextLabel.sizeL(
            semanticslabel: 'AppBarText',
            text: "Project Demo",
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert, semanticLabel: 'IconAlert'),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('This is a snackbar')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu, semanticLabel: 'IconMenu'),
            onPressed: () => showDialogMenu(context: context, controller: _tabController)
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.pink[100],
            height: MediaQuery.of(context).size.height - ((getHApp+getHTab)-10),
            padding: const EdgeInsets.all(20.0),
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                MockPageTab2(),
                MockPageTab4(),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                key: _tabbarKey,
                padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewPadding.bottom > 0 ? 25 : 0, top: 0.0),
                decoration: BoxDecoration(
                  color: Colors.black,
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
    );
  }
}

class MockArguments {
  int? setTab;

  MockArguments({this.setTab});
}