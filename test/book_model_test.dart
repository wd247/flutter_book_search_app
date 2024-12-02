import 'dart:convert';

import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //
  test('Book model test', () {
    //
    String dummyData = """
 {
      "title": "Harry",
      "link": "https://search.shopping.naver.com/book/catalog/32534728678",
      "image": "https://shopping-phinf.pstatic.net/main_3253472/32534728678.20220523045017.jpg",
      "author": "",
      "discount": "65140",
      "publisher": "Authorhouse",
      "pubdate": "20181108",
      "isbn": "9781546292463",
      "description": "Set in the 1980s, Harry is a young girl who, overnight, turned from a chrysalis into a butterfly. Harry finds love and fame whilst on a family holiday in Spain."
    }
""";
    //  1. Map 으로 변환
    Map<String, dynamic> map = jsonDecode(dummyData);
    //  2. 객체로 변환
    Book book = Book.fromJson(map);
    expect(book.discount, '65140');
    print(book.toJson());
  });
}
