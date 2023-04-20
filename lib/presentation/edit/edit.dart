import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poem_app/domain/navigation/named_routes.dart';
import 'package:poem_app/presentation/edit/poem_text.dart';
import 'package:poem_app/presentation/styles/texts.dart';

import '/di.dart';
import '../lang.dart';
import 'align_button.dart';

class EditPage extends ConsumerWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logger.i("Edit page build");
    final editManager = ref.watch(poemEditManager);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                const BackButton(),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    Lang.of(context).save,
                    style: ThemeText.smallBold.copyWith(color: Colors.red),
                  ),
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                hintText: firstCapitalized(Lang.of(context).title),
                border: InputBorder.none,
              ),
              style: ThemeText.defaultPoemTitle,
              textCapitalization: TextCapitalization.words,
            ),
            const Expanded(child: PoemText()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AlignButton(
                  alignFunc: editManager.changeAlign,
                  align: TextAlign.left,
                  icon: SvgPicture.asset(
                    'assets/appearance/align_icons/align-left.svg',
                  ),
                ),
                AlignButton(
                  alignFunc: editManager.changeAlign,
                  align: TextAlign.center,
                  icon: SvgPicture.asset(
                    'assets/appearance/align_icons/align-center.svg',
                  ),
                ),
                AlignButton(
                  alignFunc: editManager.changeAlign,
                  align: TextAlign.right,
                  icon: SvgPicture.asset(
                    'assets/appearance/align_icons/align-right.svg',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// in future, this formatter should capitalize those and only
// those letters which user has not made capitalized on purpose
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    logger.i('UpperCaseFormatter');
    LineSplitter ls = const LineSplitter();
    var lines = ls.convert(newValue.text);
    for (int i = 0; i < lines.length; ++i) {
      lines[i] = firstCapitalized(lines[i]);
    }
    var newText = lines.join('\n');
    if (newValue.text.isNotEmpty &&
        newValue.text[newValue.text.length - 1] == '\n') {
      newText += '\n';
    }
    return TextEditingValue(
      text: newText,
      selection: newValue.selection,
    );
  }
}

String firstCapitalized(String value) {
  if (value.isEmpty) return value;
  return "${value[0].toUpperCase()}${value.substring(1)}";
}

class FourStringsEnter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text,
      selection: newValue.selection,
    );
  }
}
