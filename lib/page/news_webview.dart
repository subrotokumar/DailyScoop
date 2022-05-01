import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:share_plus/share_plus.dart';

import 'dart:async';

class NewsWebview extends StatefulWidget {
  final String postUrl;
  NewsWebview({@required this.postUrl});

  @override
  _NewsWebviewState createState() => _NewsWebviewState();
}

class _NewsWebviewState extends State<NewsWebview> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  PreferredSizeWidget appBar = AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Text(
          'Daily',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Scoop ',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(
          Icons.newspaper,
          color: Colors.grey,
        ),
      ],
    ),
    elevation: 0.0,
    backgroundColor: Colors.white10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black87),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Daily',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Scoop ',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.newspaper,
              color: Colors.grey,
            ),
          ],
        ),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: () {
                Share.share(widget.postUrl);
              },
              child: const Icon(
                Icons.share,
              ),
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.postUrl,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }
}
