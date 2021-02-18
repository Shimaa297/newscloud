import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newscloud/constant.dart';
import 'package:newscloud/screens/homePage.dart';
import 'package:newscloud/view_modeles/list_of_article_view_model.dart';
import 'package:provider/provider.dart';

import 'details_screen.dart';

class DetailsCategory extends StatefulWidget {

  final String category;
  DetailsCategory({this.category});


  @override
  _DetailsCategoryState createState() => _DetailsCategoryState();
}

class _DetailsCategoryState extends State<DetailsCategory> {


  @override
  void initState() {
    super.initState();
    Provider.of<ArticlesListViewModel>(
      context,
      listen: false,
    ).fetchArticlesByCategory(widget.category);
  }


  @override
  Widget build(BuildContext context) {
    var articlesListView = Provider.of<ArticlesListViewModel>(context);
    var heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
              text: 'News',
              style: TextStyle(
                  color: Colors.indigo[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
              children: [
                TextSpan(
                    text: 'Cloud',
                    style: TextStyle(
                        color: Colors.lightBlue[300],
                        fontWeight: FontWeight.bold,
                        fontSize: 25))
              ]),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body:
      Container(
        height: heightScreen ,
        child: ListView.builder(
            itemCount: articlesListView.articlesListByCategory.length,
            itemBuilder: (context, index) {
              var articleCategory = articlesListView.articlesListByCategory[index];
              return Column(
                children: [
                  Stack(
                    children: [

                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen(blogUrl: articleCategory.url);
                              }));
                        },
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            height: heightScreen * .45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.indigo[50], offset: Offset(3, 3), blurRadius: 1),
                                  BoxShadow(
                                      color: Colors.indigo[50], offset: Offset(-3, 3), blurRadius: 1),
                                ],
                                border: Border.all(width:4, color: Colors.indigo[50]),
                                color: Colors.white
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10, left: 10),
                              child: Column(
                                children: [
                                  Text(
                                    articleCategory.title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.indigo[900]),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Container(
                                    height: heightScreen * .2,
                                    child: CachedNetworkImage(
                                      imageUrl: articleCategory.imageUrl,
                                      placeholder: (context, url) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                      imageBuilder: (context, imageProvider) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20.0),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Text(
                                    articleCategory.description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                        color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
