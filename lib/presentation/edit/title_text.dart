import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di.dart';
import '../lang.dart';
import '../styles/texts.dart';
import 'edit.dart';

class TitleText extends ConsumerWidget {
  const TitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editManager = ref.watch(poemEditManager);

    String startTitleText = "";
    if (editManager.poemIsCreatedBefore()) {
      startTitleText = ref
          .read(
        poemsNotifierProvider,
      )[ref.read(poemEditNotifier).poemEditIndex!]
          .title; // TODO: should i make it with manager?
    }
    final controller = TextEditingController();
    controller.value = TextEditingValue(
      text: startTitleText,
      selection: TextSelection.fromPosition(
        TextPosition(offset: startTitleText.length),
      ),
    );

    return TextField(
      decoration: InputDecoration(
        hintText: firstCapitalized(Lang.of(context).title),
        border: InputBorder.none,
      ),
      style: ThemeText.defaultPoemTitle,
      textCapitalization: TextCapitalization.words,
      controller: controller,
    );
  }
}
