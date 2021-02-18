
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newscloud/screens/details_screen.dart';
import 'package:newscloud/view_modeles/list_of_article_view_model.dart';
import 'package:provider/provider.dart';

import 'screens/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ArticlesListViewModel>(
      create: (context) => ArticlesListViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News Cloud',
        initialRoute: Logo.id,
        routes: {
          Logo.id: (context)=> Logo(),
          HomePage.id : (context)=> HomePage()
        },
        theme: ThemeData(
          iconTheme: IconThemeData(
            color: Colors.indigo[900],
          ),
          scaffoldBackgroundColor: Color(0xfffefdfd),
          appBarTheme: AppBarTheme(
            color: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}


class Logo extends StatefulWidget {
  static String id = 'Logo';
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), ()=> Navigator.pushNamed(context, HomePage.id));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('images/logoNews.jpg', height: 400, width: 400, fit: BoxFit.contain,)),
        ],
      ),
    );
  }
}