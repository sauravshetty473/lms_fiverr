import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_fiverr/providers.dart';

import 'app_drawer.dart';

class CustomScaffold extends HookConsumerWidget {
  final Widget body;
  final String? imageUrl;
  final bool noAction;

  const CustomScaffold(
      {Key? key, required this.body, this.imageUrl, this.noAction = false})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(pageIndexProvider);
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade300,
        actions: [
          if (pageIndex > 0 && pageIndex < 4 && !noAction)
            IconButton(
              onPressed: () {
                ref
                    .read(pageIndexProvider.notifier)
                    .update((state) => state - 1);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded),
              color: Colors.white,
            )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (imageUrl != null)
              Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
            body
          ],
        ),
      ),
    );
  }
}
