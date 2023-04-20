import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di.dart';
import '../../domain/navigation/named_routes.dart';
import '../lang.dart';
import '../styles/texts.dart';
import 'edit.dart';

class PoemText extends ConsumerWidget {
  const PoemText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final poemState = ref.watch(poemEditNotifier);
    logger.i(
      "Main edit field for poem build, poem index: ${poemState.poemEditIndex}",
    );

    final editManager = ref.watch(poemEditManager);

    String startTextPoem = "";
    if (editManager.poemIsCreatedBefore()) {
      startTextPoem = ref
          .read(
            poemsNotifierProvider,
          )[ref.read(poemEditNotifier).poemEditIndex!]
          .poem; // TODO: should i make it with manager?
    }
    final controller = TextEditingController();
    controller.value = TextEditingValue(
      text: startTextPoem,
      selection: TextSelection.fromPosition(
        TextPosition(offset: startTextPoem.length),
      ),
    );

    return SingleChildScrollView(
      child: TextField(
        decoration: InputDecoration(
          hintText: firstCapitalized(Lang.of(context).textOfPoem),
          border: InputBorder.none,
        ),
        minLines: 100,
        style: ThemeText.defaultPoem,
        maxLines: null,
        textCapitalization: TextCapitalization.sentences,
        cursorColor: Colors.red,
        textAlign: poemState.align,
        autofocus: true,
        keyboardType: TextInputType.multiline,
        controller: controller,
      ),
    );
  }
}
