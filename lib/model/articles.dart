

import 'package:newscloud/model/article.dart';

class Articles{
  final List<dynamic> articles;

  Articles({this.articles});

  factory Articles.fromJson(Map< String , dynamic > jsonData)
  {
    return Articles(
      articles: jsonData['articles']
    );
  }
}