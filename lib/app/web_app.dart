import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:provider/provider.dart';
import 'package:zeyarah/features/auth/presentation/screens/android_auth_gate.dart';
import 'package:zeyarah/features/home/presentation/screen/home_screen.dart';
import 'package:zeyarah/features/landing/presentation/screens/android_landing_screen.dart';
import 'package:zeyarah/features/payment/presentation/screen/payment.dart';
import 'package:zeyarah/features/trip_packages/presentation/screen/package_details.dart';
import 'package:zeyarah/features/trip_packages/presentation/screen/packages_screen.dart';
import 'package:zeyarah/features/trip_tracker/presentation/screen/tracking.dart';
import 'package:zeyarah/features/trip_tracker/presentation/screen/trip_details.dart';

class WebApp extends StatelessWidget {
  const WebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            useMaterial3: true),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        initialRoute: '/',
        routes: {
          '/': (context) => const AndroidAuthGate(),
          '/home': (context) => const HomeScreen(),
          '/on_boardin': (context) => const OnBoardingPage(),

          "/pakages": (context) => const PackagesScreen(),
          "/packages_details": (context) => const PackageDetails(),
          "/payment": (context) => const PaymentScreen(),

          //"/settings": (context) => const Settings(),
          "/tracking": (context) => const Tracking(),
          "/trip_details": (context) => const TripDetails(),
          "/profile": (context) => const ProfileScreen(),
        },

    );
  }
}
