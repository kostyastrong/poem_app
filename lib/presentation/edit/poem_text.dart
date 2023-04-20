import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/domain/db/db_manager.dart';

import '../../di.dart';
import '../../domain/models/poem_model.dart';
import '../../domain/navigation/named_routes.dart';
import '../lang.dart';
import '../styles/texts.dart';
import 'edit.dart';

class PoemText extends ConsumerWidget {
  PoemText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final poemState = ref.watch(poemEditNotifier);
    logger.i(
      "Main edit field for poem build, poem index: ${poemState.poemEditIndex}",
    );

    final editManager = ref.watch(poemEditManager);
    ref.read(dbPoemsManagerProvider);  // TODO: init?
    final controller = ref.read(dbPoemsManagerProvider).poemFieldController;

    String startPoemText = "";
    if (editManager.poemIsCreatedBefore()) {
      startPoemText = ref
          .read(
            poemsNotifierProvider,
          )[editManager.getIndex()!]
          .poem; // TODO: should i make it with manager?
    } else {
      ref.read(poemEditManager).updatePoemEditIndex(
          ref.read(dbPoemsManagerProvider).addEmptyPoem());
    }

    controller?.value = TextEditingValue(
      text: startPoemText,
      selection: TextSelection.fromPosition(
        TextPosition(offset: startPoemText.length),
      ),
    );

    void changeTextPoem() {
      final newText = controller!.text;
      final container = ProviderContainer();
      PoemModel newPoem = PoemModel(
          index: editManager.getIndex()!, poem: newText, title: , lastEdited: DateTime
          .now()
          .millisecondsSinceEpoch);
    }

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
