import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poem_app/domain/navigation/named_routes.dart';
import 'package:poem_app/presentation/styles/texts.dart';

import '../lang.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[50],
                    shape: const CircleBorder(),
                    side: const BorderSide(color: Colors.red, width: 2),
                  ),
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      '1',
                      style: ThemeText.smallBold,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[50],
                    shape: const CircleBorder(),
                    side: const BorderSide(color: Colors.red, width: 2),
                  ),
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      '2',
                      style: ThemeText.smallBold,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[50],
                    shape: const CircleBorder(),
                    side: const BorderSide(color: Colors.red, width: 2),
                  ),
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      '3',
                      style: ThemeText.smallBold,
                    ),
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

class PoemText extends StatefulWidget {
  const PoemText({Key? key}) : super(key: key);

  @override
  State<PoemText> createState() => _PoemTextState();
}

class _PoemTextState extends State<PoemText> {
  @override
  Widget build(BuildContext context) {
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
        inputFormatters: const [
          //UpperCaseTextFormatter(),
        ],
        cursorColor: Colors.red,
        autofocus: true,
        keyboardType: TextInputType.multiline,
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
