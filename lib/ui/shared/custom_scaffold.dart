import 'package:flutter/material.dart';

import '../app_drawer.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final String? imageUrl;

  const CustomScaffold({Key? key, required this.body, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (imageUrl != null)
              Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 100,
              ),
            body
          ],
        ),
      ),
    );
  }
}
