import 'package:flutter/material.dart';




class TextFieldDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterWidgetState();
  }
}

class RegisterWidgetState extends State<TextFieldDemo> {
  String _string = '';
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      setState(() {
        _string = "${textEditingController.text}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView(
            children: [
              Text('$_string'),
              TextField(
                  onSubmitted: (value) {
                    setState(() {
                      _string = value;
                    });
                  },
                  decoration: InputDecoration(hintText: "提交改变")),
              TextField(
                  onChanged: (value) {
                    setState(() {
                      _string = value;
                    });
                  },
                  decoration: InputDecoration(hintText: "输入改变")),
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(hintText: "controller"),
              ),
              TextField(
                  decoration: InputDecoration(
                      labelText: "输入",
                      icon: Icon(Icons.add),
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 3)))),
            ],
          ),
        ),
      ),
    );
  }
}
