import 'package:flutter/material.dart';
import 'package:zeyarah/core/util/dialog/generic_dialog.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) {
  return showGenericDialog<void>(
    context: context,
    title: "generic",
    content: text,
    optionsBuilder: () => {
      "ok": null,
    },
  );
}
