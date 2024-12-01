import 'package:flutter/material.dart';

//test
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: TextField(),
        ),
        body: Text('HomePage'),
      ),
    );
  }
}
