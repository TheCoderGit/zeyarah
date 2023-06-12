import 'package:flutter/material.dart';

import 'package:zeyarah/core/util/dialog/generic_dialog.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: "log out",
    content: "log out dialog content",
    optionsBuilder: () => {
      "cancel": false,
      "log out": true,
    },
  ).then(
    (value) => value ?? false,
  );
}
