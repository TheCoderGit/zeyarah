import 'package:flutter/cupertino.dart';
import 'package:flutterfire_ui/auth.dart';

class IOSLandingScreen extends StatelessWidget {
  const IOSLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Zeyarah'),
        trailing: CupertinoButton.filled(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.person),
          onPressed: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context) {
              return ProfileScreen(
                cupertinoNavigationBar: const CupertinoNavigationBar(
                  middle: Text('User Profile'),
                ),
                actions: [
                  SignedOutAction((context) {
                    Navigator.of(context).pop();
                  })
                ],
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset('assets/images/dash.png'),
                    ),
                  ),
                ],
              );
            }));
          },
        ),
        automaticallyImplyMiddle: false,
        automaticallyImplyLeading: false,
      ),
      child: Center(
        child: Column(
          children: [
            Image.asset('assets/images/dash.png'),
            Text(
              'Welcome! the Ios Application is not ready yet',
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}
