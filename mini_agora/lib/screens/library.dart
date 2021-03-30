import 'package:flutter/material.dart';
import 'give_book.dart';
import 'package:mini_agora/screens/search_screen.dart';

class AgoraLibrary extends StatefulWidget {
  @override
  _AgoraLibraryState createState() => _AgoraLibraryState();
}

class _AgoraLibraryState extends State<AgoraLibrary> {
  int _currentIndex = 0;
  List<Widget> _children = [];

  @override
  void initState() {
    super.initState();
    _children.add(_drawGrid());
    _children.add(GiveBook());
    _children.add(SearchScreen());
  }

  Widget build(BuildContext context) {
    final title = 'Fiores Bakery Library';

    return MaterialApp(
        title: title,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              title,
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: _children[_currentIndex],
          bottomNavigationBar: _buildBottomNavigationBar(),
        ));
  }

  GridView _drawGrid() {
    List<AssetImage> bookImageList = [
      AssetImage('book_images/book1.jpeg'),
      AssetImage('book_images/book2.jpeg'),
      AssetImage('book_images/book3.jpeg'),
      AssetImage('book_images/book4.jpeg'),
      AssetImage('book_images/book5.jpeg'),
      AssetImage('book_images/book6.jpeg'),
      AssetImage('book_images/book7.jpeg'),
      AssetImage('book_images/book8.jpeg'),
      AssetImage('book_images/book9.jpeg'),
    ];
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(
        bookImageList.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Image(
                image: AssetImage('book_images/book${index + 1}.jpeg'),
                height: double.maxFinite,
                width: double.maxFinite,
              ),
            ),
          );
        },
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Catelog',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: 'Give',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        )
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
    );
  }

  // _onTabTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }
}
