import 'package:flutter/material.dart';
import 'package:news_c7_sat/model/news_response.dart';

class NewsWidget extends StatelessWidget {
  Article article;

  NewsWidget(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(article.urlToImage ?? ""),
          SizedBox(
            height: 6,
          ),
          Text(
            article.author ?? "",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
          SizedBox(
            height: 6,
          ),
          Text(article.title ?? "",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18, color: Colors.black)),
          SizedBox(
            height: 6,
          ),
          Text(article.publishedAt ?? "",
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 14, color: Colors.grey[500]))
        ],
      ),
    );
  }
}
