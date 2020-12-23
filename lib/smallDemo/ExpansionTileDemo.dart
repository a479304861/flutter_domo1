import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatefulWidget {
  @override
  _ExpansionTileDemoState createState() => _ExpansionTileDemoState();
}

class _ExpansionTileDemoState extends State<ExpansionTileDemo> {
  bool _data = false;

  List<bool> isExpandedList;

  @override
  void initState() {
    isExpandedList = List.generate(20, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Text("$_data"),
          buildExpansion(),
          ExpansionPanelList(
            children: getList(),
            expansionCallback: (int panelIndex, bool isExpanded) {
              isExpandedList[panelIndex] = !isExpanded;
              setState(() {});
            },
          ),
        ],
      )),
      appBar: AppBar(),
    );
  }

  List<ExpansionPanel> getList() {
    List<ExpansionPanel> result = List<ExpansionPanel>();
    isExpandedList.forEach((element) {
      result.add(buildExpansionPanel(isExpandedList.indexOf(element)));
    });
    return result;
  }

  buildExpansion() {
    return ExpansionTile(
      title: Text("title"),
      leading: Text("leading"),
      subtitle: Text("subtitle"),
      children: [
        //子item
        Text("children"),
        Text("children"),
      ],
      backgroundColor: Color(0xffaaaaaa),
      //打开后颜色
      childrenPadding: EdgeInsets.all(20),
      //孩子与选框的padding
      onExpansionChanged: (value) {
        //打开状态发生改变
        _data = value;
        setState(() {});
      },
      trailing: Text("trailing"),
      //右边栏
      //初始化打开
      maintainState: true,
      tilePadding: EdgeInsets.all(10),
      expandedAlignment: Alignment.bottomLeft,
      expandedCrossAxisAlignment: CrossAxisAlignment.end,
    );
  }

  ExpansionPanel buildExpansionPanel(int index) {
    return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return Text("header");
        },
        body: Text("body"),
        isExpanded: isExpandedList[index]);
  }
}
