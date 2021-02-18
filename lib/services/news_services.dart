import 'dart:convert';

import 'package:newscloud/model/article.dart';
import 'package:http/http.dart' as http;
import 'package:newscloud/model/articles.dart';

class NewsApi {
  final String urlKey = '4c1b83ce5f5740b5950723a3c9a63b73';

  Future<List<Article>> fetchArticles() async {
    try {
      http.Response response = await http.get(
          'https://newsapi.org/v2/top-headlines?country=eg&apiKey=$urlKey');
      if(response.statusCode == 200)
      {
        String data = response.body;
        var jsonData = jsonDecode(data);
        Articles articles = Articles.fromJson(jsonData);
        List<Article> articlesList = articles.articles.map((e) => Article.fromJson(e)).toList();
        return articlesList;
      }else
        {
          print('status code = ${response.statusCode}');
        }
    } catch (ex) {
      print(ex);
    }
  }

  Future<List<Article>> fetchArticlesByCategory( String category) async {
    try {
      http.Response response = await http.get(
          'https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$urlKey');
      if(response.statusCode == 200)
      {
        String data = response.body;
        var jsonData = jsonDecode(data);
        Articles articles = Articles.fromJson(jsonData);
        List<Article> articlesList = articles.articles.map((e) => Article.fromJson(e)).toList();
        return articlesList;
      }else
      {
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }
}
