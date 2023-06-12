import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:zeyarah/features/trip_tracker/data/model/landmark.dart';
import 'package:zeyarah/features/trip_packages/data/model/package.dart';

class DummyData {
  ///landmarks
  static LandMark masjedNabawi = LandMark(
      id: 1,
      name: "Masjed Nabawi",
      imagePath: "assets/images/masjidnabawi.jpg",
      location: const LatLng(24.473507668785935, 39.61205461231354),
      time: 60);
  static LandMark sayedShohadaa = LandMark(
      id: 2,
      name: "Masjed Qiblatain",
      imagePath: "assets/images/Masjid_al-Qiblatain.jpg",
      location: const LatLng(24.504217820968194, 39.61199813563911),
      time: 30);
  static LandMark masjedQuebaa = LandMark(
      id: 3,
      name: "Masjed Quebaa",
      imagePath: "assets/images/Masjid_Quba.jpeg",
      location: const LatLng(24.44028311619852, 39.617261105103616),
      time: 30);
  static LandMark testLandMarkHome = LandMark(
      id: 4,
      name: 'Home',
      imagePath: "assets/images/Masjid_Quba.jpeg",
      location: const LatLng(30.1490, 31.3983),
      time: 25);
  static LandMark testLandMarkWork = LandMark(
      id: 5,
      name: 'Work',
      imagePath: "assets/images/Masjid_Quba.jpeg",
      location: const LatLng(30.0064, 31.4017),
      time: 25);

  ///packages
  static Package standardPackage = Package(
      id: 1,
      name: "standared",
      price: 200,
      listOfLandMarks: [masjedNabawi],
      availableLanguages: ["Arabic", "English"]);
  static Package premiumPackage = Package(
      id: 2,
      name: "premium",
      price: 300,
      listOfLandMarks: [masjedNabawi, sayedShohadaa],
      availableLanguages: ["Arabic", "English"]);
  static Package ellitePackage = Package(
    id: 3,
    name: "Ellite",
    price: 400,
    listOfLandMarks: [
      sayedShohadaa,
      masjedNabawi,
      masjedQuebaa,
    ],
    availableLanguages: ["Arabic", "English"],
  );
  static Package testPackage = Package(
    id: 3,
    name: "Test",
    price: 100,
    listOfLandMarks: [
      testLandMarkHome,
      testLandMarkWork,
    ],
    availableLanguages: ["Arabic", "English"],
  );

  static List<Package> packages = [
    standardPackage,
    premiumPackage,
    ellitePackage,
    testPackage
  ];
}
