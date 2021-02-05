import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatefulWidget {
  final String sessionId;
  final orderId;
  final productId;
  final amount;
  final apiKey =
      'pk_test_51HoVloFCtPrEUwqKMyveFX2ipyvtPg39HtQsY1MM20X0Qpw1FTA19LKlguQj6w7Puc4gDe3YDJlmOBgwPUoqrAIQ009xhiuQDG';
  const PaymentWebView(
      {Key key, this.sessionId, this.orderId, this.productId, this.amount})
      : super(key: key);

  @override
  _PaymentWebViewState createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WebView(
        initialUrl: initialUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (webViewController) =>
            _webViewController = webViewController,
        onPageFinished: (String url) {
          if (url == initialUrl) {
            _redirectToStripe(widget.sessionId, widget.apiKey);
          }
        },
        navigationDelegate: (NavigationRequest request) async {
          if (request.url.startsWith(
              'https://admin.godfatherofbodybuilding.com/success')) {


            } else {
            }
          }



      ),
    );
  }

  String get initialUrl => 'https://marcinusx.github.io/test1/index.html';

  Future<void> _redirectToStripe(String sessionId, String apiKey) async {
    final redirectToCheckoutJs = '''
var stripe = Stripe(\'$apiKey\');
    
stripe.redirectToCheckout({
  sessionId: '$sessionId'
}).then(function (result) {
  result.error.message = 'Error'
});
''';

    try {
      await _webViewController.evaluateJavascript(redirectToCheckoutJs);
    } on PlatformException catch (e) {
      if (!e.details.contains(
          'JavaScript execution returned a result of an unsupported type')) {
        rethrow;
      }
    }
  }
}
