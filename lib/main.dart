import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'product_flash_card.dart';
import 'memo.dart';
import 'test_dorian.dart';

void main() => runApp(Display());

class Display extends StatelessWidget {
  final Color ekoGreen = Color.fromARGB(255, 0, 205, 130);
  final Color ekoDarkGreen = Color.fromARGB(255, 0, 151, 95);
  final Color ekoDarkGrey = Colors.blueGrey[700];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'test',

        //Themes
        theme: ThemeData(
          primaryColor: ekoGreen,
          accentColor: ekoDarkGreen,
          //backgroundColor: Color.fromARGB(255, 200, 200, 200),
          //scaffoldBackgroundColor: Color.fromARGB(255, 200, 200, 200),
          scaffoldBackgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.blueGrey[700]),
          textTheme: TextTheme(
              bodyText1: TextStyle(
                  color: Colors.blueGrey,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.normal),
              headline1: TextStyle(
                color: Colors.blueGrey[700],
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(color: Colors.white)),
        ),
        darkTheme: ThemeData(
          primaryColor: ekoGreen,
          accentColor: ekoDarkGreen,
          scaffoldBackgroundColor: Color.fromARGB(255, 32, 32, 32),
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: TextTheme(
              bodyText1: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.normal),
              headline1: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(color: Colors.black)),
        ),

        // Widget to change to perform tests
        home: EkoScan());
  }
}

class EkoScan extends StatefulWidget {
  EkoScan({Key key}) : super(key: key);

  @override
  EkoScan_State createState() => EkoScan_State();
}

class EkoScan_State extends State<EkoScan> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[/*
          Center(
            child: FicheProduit(),
          ),*/
          Center(
            child: Scanner(),
          ),
          Center(
            child: Memo(),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(color: Theme.of(context).accentColor),
            tabs: <Widget>[
              Tab(
                child: Column(
                  children: [
                    Icon(
                      Icons.bar_chart,
                      color: Theme.of(context).textTheme.button.color,
                    ),
                    Text("History", style: Theme.of(context).textTheme.button)
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: [
                    Icon(Icons.aspect_ratio,
                        color: Theme.of(context).textTheme.button.color),
                    Text("Scan", style: Theme.of(context).textTheme.button)
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: [
                    Icon(Icons.article_outlined,
                        color: Theme.of(context).textTheme.button.color),
                    Text("Memo", style: Theme.of(context).textTheme.button)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
