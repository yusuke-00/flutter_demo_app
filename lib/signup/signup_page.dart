import 'package:flutter/material.dart';
import 'package:flutter_demo_app/domain/book.dart';
import 'package:provider/provider.dart';

import 'signup_model.dart';

// ignore: must_be_immutable
class SignUpPage extends StatelessWidget {
  Book get book => null;

  Book get title => null;

  @override
  Widget build(BuildContext context) {
    final mailController = TextEditingController();
    final passwordController = TextEditingController();
    return ChangeNotifierProvider<SignUpkModel>(
      create: (_) => SignUpkModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("サインアップ"),
        ),
        body: Consumer<SignUpkModel>(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: "メールアドレス"),
                    controller: mailController,
                    onChanged: (text) {
                      model.mail = text;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "パスワード"),
                    controller: passwordController,
                    obscureText: true,
                    onChanged: (text) {
                      model.password = text;
                    },
                  ),
                  RaisedButton(
                    child: Text("登録する"),
                    onPressed: () async {
                      try {
                        await model.signUp();
                        _showDialog(
                          context,
                          "登録完了しました",
                          title,
                        );
                      } catch (e) {
                        _showDialog(
                          context,
                          e.toString(),
                          book,
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future _showDialog(
    BuildContext context,
    String title,
    Book book,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: <Widget>[
            FlatButton(
              child: Text("ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
