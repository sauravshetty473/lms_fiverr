import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_fiverr/ui/shared/image_text.dart';

class ActionsWidget extends HookConsumerWidget {
  final Widget? child;
  final String imageUrl;
  final String text;

  const ActionsWidget(
      {Key? key,
      required this.child,
      required this.imageUrl,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alter = useState<bool>(false);
    return GestureDetector(
      onTap: alter.value || child == null
          ? null
          : () {
              alter.value = true;
            },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: alter.value && child != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  child!,
                  GestureDetector(
                    onTap: () {
                      alter.value = false;
                    },
                    child: const Icon(
                      Icons.cancel,
                      size: 40,
                    ),
                  )
                ],
              )
            : ImageText(
                imageUrl: imageUrl,
                text: text,
                alter: true,
              ),
      ),
    );
  }
}
