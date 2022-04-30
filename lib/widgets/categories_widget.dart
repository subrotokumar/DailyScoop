import 'package:cached_network_image/cached_network_image.dart';
import 'package:dailyscoop/page/home.dart';
import 'package:dailyscoop/widgets/news_widget.dart';
import 'package:flutter/material.dart';

import '../data/meta_data.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key key}) : super(key: key);

  String categoryReturn(String cat) {
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 7),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(categoryList[index].route),
                  ),
                );
              },
              splashColor: Colors.black,
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: categoryList[index].url,
                      height: 50,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 120,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      categoryList[index].title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CategoryModel {
  String title;
  String url;
  CategoryModel(this.title, this.url);
}
