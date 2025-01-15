import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/utils/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../components/text/textlabel.dart';

class MockPageTab4 extends StatefulWidget {
  const MockPageTab4({super.key});

  @override
  State<MockPageTab4> createState() => _MockPageTab4State();
}

class _MockPageTab4State extends State<MockPageTab4> {

  late WebViewController _webViewController;
  int loadingPercentage = 0;

  @override
  void initState() {
    loadWebView();
    super.initState();
  }

  void loadWebView() {
    final WebViewController controller = WebViewController();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (int progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
          onHttpError: (HttpResponseError error) {},
          onUrlChange: (UrlChange change) {},
          onHttpAuthRequest: (HttpAuthRequest request) {},
        ),
      )
      // WebView html code
      // final url = Uri.dataFromString('''
      // <!-- TradingView Widget BEGIN -->
      // <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0,minimum-scale=1">
      // <!-- TradingView Widget BEGIN -->
      // <div class="tradingview-widget-container">
      //   <div id="tradingview_3628d"></div>
      //   <div class="tradingview-widget-copyright"><a href="https://th.tradingview.com/symbols/XAUUSD/" rel="noopener" target="_blank"><span class="blue-text">XAUUSD ชาร์ต</span></a> โดย TradingView</div>
      //   <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
      //   <script type="text/javascript">
      //   new TradingView.widget(
      //     {
      //       "autosize": true,
      //       "symbol": "OANDA:XAUUSD",
      //       "interval": "1",
      //       "timezone": "Etc/UTC",
      //       "theme": "light",
      //       "style": "1",
      //       "locale": "th_TH",
      //       "toolbar_bg": "#f1f3f6",
      //       "enable_publishing": false,
      //       "hide_side_toolbar": false,
      //       "allow_symbol_change": true,
      //       "container_id": "tradingview_3628d"
      //     }
      //   );
      //   </script>
      // </div>
      // <!-- TradingView Widget END -->
      // ''', mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString();    
      // ..loadRequest(Uri.parse(url));
      // WebView html file
      ..loadFlutterAsset('assets/chart/MarketMainChart_2.html');
    _webViewController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () => context.go('/market_by_price'),
              child: TextLabel.sizeM(
                semanticslabel: 'MarkeyByPriceButton',
                text: "Go to Markey By Price Page",
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
                color: MyColors.red,
                fontSize: 17,
              ),
            ),
          ),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            padding: EdgeInsets.all(10.0),
            child: WebViewWidget(
              controller: _webViewController,
            )
          ),
        ],
      ),
    );
  }
}