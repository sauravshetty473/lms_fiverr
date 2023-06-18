import 'package:flutter/material.dart';
import 'package:lms_fiverr/ui/choose_teacher.dart';
import 'package:lms_fiverr/ui/shared/custom_scaffold.dart';
import 'package:lms_fiverr/ui/shared/text_box.dart';

class ChooseTime extends StatelessWidget {
  const ChooseTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      imageUrl:
      'https://media.istockphoto.com/id/1385970223/photo/great-idea-of-a-marketing-strategy-plan-at-a-creative-office.jpg?s=2048x2048&w=is&k=20&c=_E_buvj4I15suYVQq7Y7iWHKku2qx7AYp7Ui4dJtkSE=',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Text('Monday'),
            ...List.generate(
              4,
                  (index) =>  TextBox(
                    onClick: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ChooseTeacher()));
                    },
                text: 'hello',
              ),
            )
          ],
        ),
      ),
    );
  }
}
