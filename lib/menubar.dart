import 'package:flutter/material.dart';
import 'main.dart';



class EKO_MenuBar extends BottomAppBar
{
  EKO_MenuBar(TabController _controller) : super(
    color: EKO_Green,
    child: TabBar(
      indicator: BoxDecoration(color: Colors.indigoAccent),
      tabs: [
        Tab(
          child: Center(
          child: Column(
            children: [
              Icon(Icons.bar_chart),
              Text('History')
            ],
          ),
        ),)
      ],
      controller: _controller
    )
  );
}