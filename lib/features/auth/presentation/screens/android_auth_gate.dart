import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:zeyarah/core/user_shared_prefs.dart';
import 'package:zeyarah/features/home/presentation/screen/home_screen.dart';
import 'package:zeyarah/features/landing/presentation/screens/android_landing_screen.dart';

class AndroidAuthGate extends StatefulWidget {
  const AndroidAuthGate({super.key});

  @override
  State<AndroidAuthGate> createState() => _AndroidAuthGateState();
}

class _AndroidAuthGateState extends State<AndroidAuthGate> {
  var firstRun = true;
  @override
  void initState() {
    firstRun = UserSharedPrefs.getFirstRun();
    super.initState();
  }

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
                      '573507791860-lqnsio91s25feon1nmaahhtmgrs1acub.apps.googleusercontent.com', //web
                  //'573507791860-51sjd86bnl9rifs93ds2ifl785ujobk3.apps.googleusercontent.com', //android
                ),
              ],
              headerBuilder: (context, constraints, shrinkOffset) {
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
                      color: Colors.grey,
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
          return firstRun ? const AndroidLandingScreen() : const HomeScreen();
        });
  }
}
