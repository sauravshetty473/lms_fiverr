import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String text;
  final Function? onClick;

  const TextBox({Key? key, required this.text, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClick == null) return;
        onClick!();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        color: Colors.blue,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
