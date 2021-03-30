import 'package:flutter/material.dart';
import 'package:mini_agora/services/books_model.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  void getData(String bookName) async {
    try {
      Map data = await BookModel().bookData(bookName);

      setState(() {
        bookTitle = data['title'];
        bookAuthor = data['author'];
      });
    } catch (e) {
      print(e);
    }
  }

  String bookTitle;
  String bookAuthor;

  @override
  void initState() {
    super.initState();
    bookTitle = '';
    bookAuthor = '';
    // getData('Pride and Prejudice');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(30, 60, 30, 0),
            child: TextField(
              onSubmitted: (value) async {
                getData(value);
              },
              decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  size: 35,
                ),
                hintText: 'Enter book name',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              ),
            ),
          ),
          Card(
            child: Text('$bookTitle'),
          ),
          Card(
            child: Text('$bookAuthor'),
          )
        ],
      ),
    );
  }
}
