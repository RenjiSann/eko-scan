import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'history.dart';
import 'memo.dart';
import 'test_dorian.dart';
import 'themes.dart';
import 'history_widget.dart';

void main() => runApp(Display());

class Display extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'test',

        //Themes
        theme: EkoScanThemes.lightTheme,
        darkTheme: EkoScanThemes.darkTheme,

        // Widget to change to perform tests
        home: EkoScan(History()));
  }
}

class EkoScan extends StatefulWidget {
  final History history;

  EkoScan(this.history) {
    history.loadHistory();
  }

  @override
  _EkoScanState createState() => _EkoScanState();
}

class _EkoScanState extends State<EkoScan> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
/*
  void addProducts(Produit produit) {
    this.setState(() {
      this.prods.insert(0, produit);
      if (this.prods.length == 20) this.prods.removeAt(this.prods.length - 1);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(child: Expanded(child: HistoryWidget(widget.history))),
          Center(child: Scanner(widget.history.addProduct)),
          Center(child: Memo())
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
