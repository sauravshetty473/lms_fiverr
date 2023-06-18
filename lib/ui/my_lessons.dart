import 'package:flutter/material.dart';
import 'package:lms_fiverr/ui/choose_weekday.dart';
import 'package:lms_fiverr/ui/shared/custom_scaffold.dart';
import 'package:lms_fiverr/ui/shared/image_text.dart';

class MyLessons extends StatelessWidget {
  const MyLessons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                .map((e) =>  ImageText(
              onClick: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ChooseWeekDay()));
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
