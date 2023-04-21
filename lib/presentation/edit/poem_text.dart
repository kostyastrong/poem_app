import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/domain/db/db_manager.dart';

import '../../di.dart';
import '../../domain/edit/poem_edit/poem_edit_manager.dart';
import '../../domain/models/poem_model.dart';
import '../../domain/navigation/named_routes.dart';
import '../lang.dart';
import '../styles/texts.dart';
import 'edit.dart';

class PoemText extends ConsumerStatefulWidget {
  PoemText({Key? key}) : super(key: key);

  @override
  ConsumerState<PoemText> createState() => _PoemTextState();
}

class _PoemTextState extends ConsumerState<PoemText> {
  late final TextEditingController controller;
  late PoemEditManager editManager;
  late DbPoemsManager dbPoemsManager;

  void changeTextPoem() {
    PoemModel newPoem = editManager.getPoem()!.copyWith(
        poem: controller.text,
        lastEdited: DateTime.now().millisecondsSinceEpoch);
    dbPoemsManager.updatePoemList(newPoem);
  }

  @override
  void initState() {
    super.initState();
    controller = ref.read(dbPoemsManagerProvider).poemFieldController!;
    controller.addListener(changeTextPoem);
  }

  @override
  Widget build(BuildContext context) {
    final poemState = ref.watch(poemEditNotifier);
    editManager = ref.watch(poemEditManager);
    dbPoemsManager = ref.watch(dbPoemsManagerProvider);

    logger.i(
      "Main edit field for poem build, poem index: ${poemState.poemEditIndex}",
    );

    String startPoemText = "";
    if (editManager.poemIsCreatedBefore()) {
      startPoemText = ref
          .read(
            poemsNotifierProvider,
          )[editManager.getIndex()!]
          .poem; // TODO: should i make it with manager?
    } else {
      ref
          .read(poemEditManager)
          .updatePoemEditIndex(ref.read(dbPoemsManagerProvider).addEmptyPoem());
    }

    controller.value = TextEditingValue(
      text: startPoemText,
      selection: TextSelection.fromPosition(
        TextPosition(offset: startPoemText.length),
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
  @override
  void dispose() {
    super.dispose();
    controller.removeListener(changeTextPoem);
  }
}
