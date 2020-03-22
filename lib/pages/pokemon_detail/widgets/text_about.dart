import 'package:flutter/material.dart';

class TextAbout extends StatelessWidget {
  final String text;
  final String description;

  const TextAbout({Key key, this.text, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            description,
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          Text(
            text,
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          SizedBox(),
        ],
      ),
    );
  }
}