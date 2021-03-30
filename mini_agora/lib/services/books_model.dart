import 'package:http/http.dart' as http;
import 'dart:convert';

class BookModel {
  String bookTitle;
  BookModel({this.bookTitle});
  // Make API call to Google Book API and return map of author and title to search screen
  Future bookData(String bookTitle) async {
    String apiKey = 'AIzaSyDvWP_e3zk7NpaUbQHyvOzKIG75FYD-9ig';
    String requestURL =
        'https://www.googleapis.com/books/v1/volumes?q=$bookTitle&key=$apiKey';

    // Makes an GET request to Google Books API and stores in a Response variable.
    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      Map bookData = {};
      // decodes http response to JSON data.
      var decodedData = jsonDecode(response.body);
      var bookTitle = decodedData['items'][0]['volumeInfo']['title'];
      var bookAuthor = decodedData['items'][0]['volumeInfo']['authors'][0];
      var bookDescription =
          decodedData['items'][0]['volumeInfo']['description'];
      bookData['title'] = bookTitle;
      bookData['author'] = bookAuthor;
      bookData['description'] = bookDescription;
      return bookData;
    } else {
      print('Something went wrong!');
    }
  }
}
