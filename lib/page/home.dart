import 'package:flutter/material.dart';

import '../widgets/categories_widget.dart';
import '../widgets/news_widget.dart';

class HomeScreen extends StatelessWidget {
  final String route;
  const HomeScreen(this.route);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
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

    return MaterialApp(
      title: 'Daily Scoop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
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
                      mediaQuery.viewPadding.bottom -
                      50) *
                  1,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: NewsWidget(route),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
