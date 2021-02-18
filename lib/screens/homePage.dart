import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newscloud/model/article.dart';
import 'package:newscloud/model/articles.dart';
import 'package:newscloud/view_modeles/list_of_article_view_model.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import 'details_category.dart';
import 'details_screen.dart';

class HomePage extends StatefulWidget {
  static String id = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // String get category => ArticlesListViewModel().articlesListByCategory.toString();

  @override
  void initState() {
    super.initState();
    Provider.of<ArticlesListViewModel>(context, listen: false).fetchArticles();
    // Provider.of<ArticlesListViewModel>(
    //   context,
    //   listen: false,
    // ).fetchArticlesByCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    var articlesListView = Provider.of<ArticlesListViewModel>(context);
    var heightScreen = MediaQuery.of(context).size.height;
    // var widthScreen = MediaQuery.of(context).size.width;

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
      ),
      body: Container(
        height: heightScreen,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              child: ListView.builder(
                itemCount: myArrayCategory.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CategoryList(
                  imageCategory: myArrayCategory[index]['imageCategory'],
                  categoryName: myArrayCategory[index]['categoryName'],
                  category: myArrayCategory[index]['category'],
                ),
              ),
            ),
            SizedBox(
              height: heightScreen * .02,
            ),
            // Container(
            //   height: 250,
            //   child: ListView.builder(
            //     itemCount: articlesListView.articlesList.length,
            //       itemBuilder: (context , index)
            //       {
            //         var article = articlesListView.articlesList[index];
            //         return Container(
            //           height: 250,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(20.0),
            //             border: Border.all(width: 2, color: Colors.white),
            //             color:  Color(0xf0ffffff),
            //             boxShadow: [
            //               BoxShadow(
            //                   color: Colors.indigo[50], offset: Offset(3, 3), blurRadius: 1),
            //               BoxShadow(
            //                   color: Colors.indigo[50], offset: Offset(-3, 3), blurRadius: 1),
            //             ],
            //           ),
            //           child: Column(
            //             children: [
            //               CachedNetworkImage(
            //                 imageUrl: article.imageUrl,
            //                 placeholder: (context, url) {
            //                   return Center(
            //                     child: CircularProgressIndicator(),
            //                   );
            //                 },
            //                 imageBuilder: (context, imageProvider) {
            //                   return Container(
            //                     decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.only(
            //                           topRight: Radius.circular(20),
            //                           topLeft: Radius.circular(20)),
            //                       image: DecorationImage(
            //                         image: imageProvider,
            //                         fit: BoxFit.cover,
            //                       ),
            //                     ),
            //                   );
            //                 },
            //               ),
            //               Text(article.title)
            //             ],
            //           ),
            //         );
            //
            //       }),
            // ),
            Container(
              height: heightScreen * 0.7-38,
              child: ListView.builder(
                  itemCount: articlesListView.articlesList.length,
                  itemBuilder: (context, index) {
                    var article = articlesListView.articlesList[index];
                    return Column(
                      children: [
                        Stack(
                          children: [

                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DetailsScreen(blogUrl: article.url);
                                  }));
                                },
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
                                            article.title,
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
                                              imageUrl: articlesListView
                                                  .articlesList[index].imageUrl,
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
                                            article.description,
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
          ],
        ),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  final String categoryName;
  final String imageCategory;
  final String category;

  CategoryList({this.imageCategory, this.categoryName, this.category});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              return DetailsCategory(category: category);
            }));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(width: 2, color: Colors.white),
          color: Color(0xf0ffffff),
          boxShadow: [
            BoxShadow(
                color: Colors.indigo[50], offset: Offset(3, 3), blurRadius: 1),
            BoxShadow(
                color: Colors.indigo[50], offset: Offset(-3, 3), blurRadius: 1),
          ],
        ),
        child: Stack(
          children: [
            Container(
              child: CachedNetworkImage(
                imageUrl: imageCategory,
                placeholder: (context, url) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                imageBuilder: (context, imageProvider) {
                  return Container(
                      decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ));
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                  child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Deco',
                    fontWeight: FontWeight.bold),
              )),
            ),
            Container(child: Opacity(
              opacity: 0.0,
                child: Text(category)),)
          ],
        ),
      ),
    );
  }
}

