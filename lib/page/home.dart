import 'package:flutter/material.dart';

import '../widgets/categories_widget.dart';
import '../widgets/news_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    PreferredSizeWidget appBar = AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            'Daily',
            style: TextStyle(color: Colors.black87),
          ),
          Text(
            'Scoop',
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
      elevation: 0.0,
      backgroundColor: Colors.white10,
    );

    return MaterialApp(
      title: 'Daily Scoop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: appBar,
        body: Column(
          children: <Widget>[
            const CategoriesWidget(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 10),
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.viewPadding.top -
                      mediaQuery.viewPadding.bottom) *
                  0.91,
              child: NewsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
