import 'package:flutter/material.dart';

class ImageText extends StatelessWidget {
  final String imageUrl;
  final String text;
  final Function? onClick;

  const ImageText(
      {Key? key, required this.imageUrl, required this.text, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClick == null) return;
        onClick!();
      },
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(text)),
        ],
      ),
    );
  }
}
