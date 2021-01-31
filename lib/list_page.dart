import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListPage extends StatelessWidget {
  List<String> titleList = ["item0", "item1", "item3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("リストページ練習画面"),
      ),
      body: Container(
        width: double.infinity,
        child: ListView.builder(
          itemCount: titleList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  title: Text(titleList[index]),
                ),
                Divider(),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          titleList.add("item4");
          print(titleList);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
