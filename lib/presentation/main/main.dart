import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/grid_view_page.dart';
import 'package:flutter_demo_app/login/login_page.dart';
import 'package:flutter_demo_app/next_page.dart';
import 'package:flutter_demo_app/presentation/book_list/book_list_page.dart';
import 'package:flutter_demo_app/provider_page.dart';
import 'package:flutter_demo_app/signup/signup_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  String text = "次へ";

  final myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutterデモ練習アプリ"),
        actions: <Widget>[Icon(Icons.add), Icon(Icons.share)],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "テキストの練習",
                  ),
                  onChanged: (text) {
                    print("First text field: $text");
                  },
                ),
                TextField(
                  focusNode: myFocusNode,
                ),
                RaisedButton(
                  child: Text("フォーカス"),
                  onPressed: () {
                    myFocusNode.requestFocus();
                  },
                ),
              ],
            ),
            RaisedButton(
              child: Text(text),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NextPage("値を渡す練習"),
                  ),
                );
                text = result;
                print(result);
              },
            ),
            RaisedButton(
              child: Text("グリッドビュー画面"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GridViewPage()),
                );
              },
            ),
            RaisedButton(
              child: Text("Providerパターンの勉強"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProviderPage()),
                );
              },
            ),
            RaisedButton(
              child: Text("新規登録"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
            ),
            RaisedButton(
              child: Text("ログイン"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
            RaisedButton(
              child: Text("本一覧"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookListPage()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
