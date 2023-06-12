import 'package:flutter/material.dart';

import 'package:zeyarah/core/util/dialog/generic_dialog.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: "password reset",
    content: "password seset dialog content",
    optionsBuilder: () => {
      "ok": null,
    },
  );
}
