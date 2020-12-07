import 'package:flutter/material.dart';




class DataContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [

              ContainWidget("hello1", "hell1o",
                  "https://www.itying.com/themes/itying/images/typescript/flutter.png"),
              ContainWidget("hello1", "hell1o",
                  "https://www.itying.com/themes/itying/images/typescript/flutter.png"),
              ContainWidget("hell1o", "hel12o",
                  "https://www.itying.com/themes/itying/images/typescript/flutter.png"),
            ],
          ),
        ));
  }


}

class ContainWidget extends StatelessWidget {


  final String title;
  final String subtitle;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
              width: 2
          )
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 28),
          ),
          Text(subtitle),
          Image.network(imageUrl),
        ],
      ),
    );
  }

  ContainWidget(this.title, this.subtitle, this.imageUrl);
}
