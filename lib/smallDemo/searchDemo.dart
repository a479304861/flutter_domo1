import 'package:flutter/material.dart';

class SearchDemo extends StatefulWidget {
  @override
  _SearchDemoState createState() => _SearchDemoState();
}

class _SearchDemoState extends State<SearchDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchBarDelegate());
              getData().then((value) => {print("$value")});
            },
            child: Text("search"),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Text("hello"),
          ],
        ),
      ),
    );
  }
}

class SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.cancel),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSuggest
        : searchData.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text.rich(TextSpan(
            children: [
              TextSpan(
                  text: suggestionList[index].substring(0, query.length),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(text: suggestionList[index].substring(query.length))
            ],
          )),
        );
      },
      itemCount: suggestionList.length,
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(primaryColor: Colors.greenAccent);
  }
}

Future<List<String>> getData() async {
  await Future.delayed(Duration(seconds: 2));
  return searchData;
}

var recentSuggest = ['first', 'second'];
var searchData = [
  'first',
  'second',
  'third',
  'forth',
];
