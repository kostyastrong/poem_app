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
    final alignState = ref.watch(appearProvider);
    logger.i("Main edit field for poem build");

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
        inputFormatters: [
          //UpperCaseTextFormatter(),
        ],
        cursorColor: Colors.red,
        textAlign: alignState.align,
        autofocus: true,
        keyboardType: TextInputType.multiline,
      ),
    );
  }
}