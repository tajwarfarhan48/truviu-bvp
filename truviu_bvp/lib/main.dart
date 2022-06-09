import 'package:flutter/material.dart';

void main() {
  runApp(const TruviuApp());
}

class TruviuApp extends StatelessWidget {
  const TruviuApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Truviu Demo",
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Truviu Demo"),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Video Page'),
                Tab(text: 'Folder System')
              ]
            )
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.add),
              Icon(Icons.abc)
            ]
          )
        )
      )
    );
  }
}
