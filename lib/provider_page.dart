import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/main_model.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Providerの練習",
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("ProviderModel"),
          ),
          // ignore: missing_return
          body: Consumer<MainModel>(builder: (context, model, child) {
            return Column(
              children: <Widget>[
                Text(
                  model.Provider1,
                  style: TextStyle(fontSize: 30),
                ),
                RaisedButton(
                    child: Text("ボタン"),
                    onPressed: () {
                      model.changeProvider1();
                    }
                    //押されたら反応する様にする
                    ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
