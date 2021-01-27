import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("グリッドビュー練習画面"),
      ),
      body: Container(
        width: double.infinity,
        child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(100, (index) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: Image.network(
                      "https://images-na.ssl-images-amazon.com/images/I/61wduEu3wPL._AC_SL1200_.jpg"),
                ),
                Text("$index"),
              ],
            );
          }),
        ),
      ),
    );
  }
}
