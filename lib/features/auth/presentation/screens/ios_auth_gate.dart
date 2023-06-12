import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutterfire_ui/auth.dart';
import 'package:zeyarah/features/landing/presentation/screens/ios_landing_screen.dart';

class IosAuthGate extends StatelessWidget {
  const IosAuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(
              providerConfigs: const [
                EmailProviderConfiguration(),
                GoogleProviderConfiguration(
                    clientId:
                        '573507791860-40fl91rdje01dr8b7opvu9g0jcn5ihbk.apps.googleusercontent.com'),
              ],
              headerBuilder: (context, constraints, shrinkoffset) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      "assets/images/prophet.png",
                      width: 300,
                      height: 300,
                    ),
                  ),
                );
              },
              subtitleBuilder: (context, action) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: action == AuthAction.signIn
                      ? const Text('please sign in')
                      : const Text('please sign up'),
                );
              },
              footerBuilder: (context, action) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "By signing in, you agree to our terms and conditions.",
                    style: TextStyle(
                      color: Color.fromRGBO(100, 100, 100, 0),
                    ),
                  ),
                );
              },
              sideBuilder: (context, shrinkoffset) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      "assets/images/prophet.png",
                      width: 200,
                      height: 200,
                    ),
                  ),
                );
              },
            );
          }
          return const IOSLandingScreen();
        });
  }
}
