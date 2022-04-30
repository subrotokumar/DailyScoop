import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../data/api_call.dart';
import '../model/article.dart';
import '../page/news_webview.dart';

class NewsWidget extends StatefulWidget {
  final String cat;
  NewsWidget(@required this.cat);

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  List<Article> newsArticle;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    GetApiData obj = GetApiData(widget.cat);
    newsArticle = await obj.getApiData();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: newsArticle.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  /////////
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsWebview(
                          postUrl: newsArticle[index].url,
                        ),
                      ),
                    );
                  },
                  /////////
                  splashColor: Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Column(children: <Widget>[
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: newsArticle[index].imageUrl,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 3,
                            horizontal: 8,
                          ),
                          child: Text(
                            newsArticle[index].title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        newsArticle[index].description.length == 0
                            ? const Center()
                            : Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  newsArticle[index].description,
                                  maxLines: 3,
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ),
                      ]),
                    ),
                  ),
                ),
              );
            },
          );
  }
}
