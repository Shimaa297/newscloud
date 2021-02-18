import 'package:flutter/cupertino.dart';
import 'package:newscloud/model/article.dart';
import 'package:newscloud/services/news_services.dart';

class ArticlesListViewModel extends ChangeNotifier
{
  // data private//
  List<Article> _articlesList = [];
  List<Article> _articlesListByCategory = [];

  Future<void>fetchArticles () async
  {
    _articlesList = await NewsApi().fetchArticles();
    notifyListeners();
  }

  Future<void>fetchArticlesByCategory (String category) async
  {
    _articlesListByCategory = await NewsApi().fetchArticlesByCategory(category);
    notifyListeners();
  }

  // use get to use data private & not edit data //

  List<Article> get articlesList => _articlesList;
  List<Article> get articlesListByCategory => _articlesListByCategory;
}