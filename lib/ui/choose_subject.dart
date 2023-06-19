import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_fiverr/providers.dart';
import 'package:lms_fiverr/ui/shared/custom_scaffold.dart';
import 'package:lms_fiverr/ui/shared/image_text.dart';

class ChooseSubject extends HookConsumerWidget {
  const ChooseSubject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScaffold(
      body: Column(
        children: [
          const Text('Welcome Saurav!'),
          const Text('Choose your lessons'),
          GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            children: [1, 2, 3]
                .map((e) => ImageText(
                      onClick: () {
                        ref
                            .read(pageIndexProvider.notifier)
                            .update((state) => 1);
                        ref.read(lessonProvider.notifier).update(
                              (state) => state.clone(subjectId: 1),
                            );
                      },
                      text: 'lesson1',
                      imageUrl:
                          'https://media.istockphoto.com/id/1385970223/photo/great-idea-of-a-marketing-strategy-plan-at-a-creative-office.jpg?s=2048x2048&w=is&k=20&c=_E_buvj4I15suYVQq7Y7iWHKku2qx7AYp7Ui4dJtkSE=',
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
