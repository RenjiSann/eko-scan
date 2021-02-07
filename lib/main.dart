import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'product_flash_card.dart';
import 'test_dorian.dart';

const Color EKO_Green = Color.fromARGB(255, 0, 205, 130);
const Color EKO_DarkGreen = Color.fromARGB(255, 0, 151, 95);

void main() => runApp(Display());

class Display extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'test',

        //Themes
        theme: ThemeData(
          primaryColor: EKO_Green,
          backgroundColor: Color.fromARGB(255, 200, 200, 200),
        ),
        darkTheme: ThemeData(
          primaryColor: EKO_Green,
          backgroundColor: Color.fromARGB(255, 88, 88, 88),
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
        children: <Widget>[
          Center(
            child: Text("History"),
          ),
          Center(
            child: Scanner(),
          ),
          Center(
            child: Text("Map"),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: EKO_Green,
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(color: EKO_DarkGreen),
            tabs: <Widget>[
              Tab(
                child: Column(
                  children: [Icon(Icons.bar_chart), Text("History")],
                ),
              ),
              Tab(
                child: Column(
                  children: [Icon(Icons.aspect_ratio), Text("Scan")],
                ),
              ),
              Tab(
                child: Column(
                  children: [Icon(Icons.map), Text("Map")],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
