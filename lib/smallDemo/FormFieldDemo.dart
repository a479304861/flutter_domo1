import 'package:flutter/material.dart';



class DataContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterWidgetState();
  }
}

class RegisterWidgetState extends State<DataContent> {
  String _userName = '';
  String _password = '';
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: formGlobalKey,
        child: Column(
          children: [
            TextFormField(
              onSaved: (value) {
                _userName = value;
              },
              decoration: InputDecoration(
                icon: Icon(Icons.people),
                hintText: "用户名",
              ),
              validator: (value){
                if(value==null||value.length==0){
                  return  "账号不能为空";
                }
                return null;
              },
            ),
            TextFormField(
              obscureText: true,
              onSaved: (value) {
                _password = value;
              },
             validator: (value){
               if(value==null||value.length==0){
                 return  "密码不能为空";
                }
               return null;
             },
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                hintText: "密码",
              ),
            ),
            SizedBox(
              width: 12,
              height: 12,
            ),
            Container(
              width: 200,
              child: RaisedButton(
                onPressed: submit,
                child: Text("登入"),
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }

  void submit() {
    formGlobalKey.currentState.save();
    formGlobalKey.currentState.validate();
    print("password:" + _password);
    print("userName:" + _userName);
  }
}
