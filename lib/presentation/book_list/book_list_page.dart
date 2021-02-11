import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/domain/book.dart';
import 'package:flutter_demo_app/presentation/add_book/add_book_page.dart';
import 'package:provider/provider.dart';

import 'book_list_model.dart';

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchBooks(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("本一覧"),
        ),
        body: Consumer<BookListModel>(
          builder: (context, model, child) {
            final books = model.books;
            // ignore: non_constant_identifier_names
            final ListTiles = books
                .map(
                  (book) => ListTile(
                    leading: Image.network(book.imageURL), //画像表示できる
                    title: Text(book.title),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () async {
                        //押されてら反応するTODO
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddBookPage(
                              book: book,
                            ),
                            fullscreenDialog: true,
                          ),
                        );
                        model.fetchBooks();
                      },
                    ),
                    onLongPress: () async {
                      //削除するコード書く
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("${book.title}削除しますか？？"),
                            actions: [
                              FlatButton(
                                child: Text("ok"),
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                  await deleteBook(context, model, book);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                )
                .toList();
            return ListView(
              children: ListTiles,
            );
          },
        ),
        floatingActionButton: Consumer<BookListModel>(
          builder: (contex, model, child) {
            return FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddBookPage(),
                    fullscreenDialog: true,
                  ),
                );
                model.fetchBooks();
              },
            );
          },
        ),
      ),
    );
  }

  Future deleteBook(
    BuildContext context,
    BookListModel model,
    Book book,
  ) async {
    try {
      await model.deleteBook(book);
      await model.fetchBooks();
    } catch (e) {
      await _showDialog(
        context,
        e.toString(),
        book,
      );
      print(e.toString());
    }
  }

  // ignore: missing_return
  Future _showDialog(
    BuildContext context,
    String title,
    Book book,
  ) {
    return showDialog(
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
