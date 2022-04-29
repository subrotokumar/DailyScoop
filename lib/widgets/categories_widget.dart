import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../data/meta_data.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      height: 60,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            splashColor: Colors.black,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              margin: const EdgeInsets.only(right: 7),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: categoryList[index].url,
                      height: 60,
                      width: 115,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 115,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      categoryList[index].title,
                      style: const TextStyle(
                        color: Colors.white,
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
