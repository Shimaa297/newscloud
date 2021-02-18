import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newscloud/model/article.dart';
import 'package:newscloud/model/articles.dart';
import 'package:newscloud/services/news_services.dart';
import 'package:newscloud/view_modeles/list_of_article_view_model.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsScreen extends StatefulWidget {
  static String id = 'DetailsScreen';
  final String blogUrl;
  DetailsScreen({this.blogUrl});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  // NewsApi newsApi = NewsApi();
  @override
  Widget build(BuildContext context) {
    // var articlesListView = Provider.of<ArticlesListViewModel>(context, listen: false);
    // var article = articlesListView;
    //var articlesListView = Provider.of<ArticlesListViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: RichText(
            text: TextSpan(
                text: 'News',
                style: TextStyle(
                    color: Colors.indigo[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
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
        body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: WebView(
                  initialUrl: widget.blogUrl,
                  onWebViewCreated: ((WebViewController webViewController) {
                    _completer.complete(webViewController);
                  }),
                  // child: Directionality(
                  //       textDirection: TextDirection.rtl,
                  //       child: Column(
                  //         children: [
                  //           Stack(
                  //             alignment: Alignment.center,
                  //             children: [
                  //               Padding(
                  //                 padding: const EdgeInsets.symmetric(horizontal: 30),
                  //                 child: Divider(
                  //                   thickness: 30,
                  //                   height: 45.0,
                  //                   color: Colors.yellow,
                  //                 ),
                  //               ),
                  //               Text('المزيد عن الخبر', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54, fontFamily: 'Deco'),)
                  //             ],
                  //           ),
                  //            Text(),
                  //         ],
                  //       ),
                  //     ),
                ),
              ));
  }
}
