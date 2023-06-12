import 'package:flutter/cupertino.dart';
import 'package:zeyarah/features/auth/presentation/screens/ios_auth_gate.dart';

class IosApp extends StatelessWidget {
  const IosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Zeyarah',
      theme: CupertinoThemeData(),
      home: IosAuthGate(),
    );
  }
}
