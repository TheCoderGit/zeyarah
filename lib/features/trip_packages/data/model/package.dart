// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:zeyarah/core/enums.dart';
import 'package:zeyarah/features/trip_tracker/data/model/landmark.dart';

class Package {
  int id;
  String name;
  PackageUsgaeStatus packageUsgaeStatus;
  double price;
  List<LandMark> listOfLandMarks;
  List<String> availableLanguages;
  Package({
    required this.id,
    required this.name,
    this.packageUsgaeStatus = PackageUsgaeStatus.notUsed,
    required this.price,
    required this.listOfLandMarks,
    required this.availableLanguages,
  });

  Package copyWith({
    int? id,
    String? name,
    PackageUsgaeStatus? packageUsgaeStatus,
    double? price,
    List<LandMark>? listOfLandMarks,
    List<String>? availableLanguages,
  }) {
    return Package(
      id: id ?? this.id,
      name: name ?? this.name,
      packageUsgaeStatus: packageUsgaeStatus ?? this.packageUsgaeStatus,
      price: price ?? this.price,
      listOfLandMarks: listOfLandMarks ?? this.listOfLandMarks,
      availableLanguages: availableLanguages ?? this.availableLanguages,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'packageUsageStatus': packageUsgaeStatus,
      'price': price,
      'listOfLandMarks': listOfLandMarks.map((x) => x.toMap()).toList(),
      'availableLanguages': availableLanguages,
    };
  }

  factory Package.fromMap(Map<String, dynamic> map) {
    return Package(
        id: map['id'] as int,
        name: map['name'] as String,
        packageUsgaeStatus: map['packageUsageStatus'],
        price: map['price'] as double,
        listOfLandMarks: List<LandMark>.from(
          (map['listOfLandMarks'] as List<int>).map<LandMark>(
            (x) => LandMark.fromMap(x as Map<String, dynamic>),
          ),
        ),
        availableLanguages: List<String>.from(
          (map['availableLanguages'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Package.fromJson(String source) =>
      Package.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Package(id: $id, name: $name, package usage status: $packageUsgaeStatus, price: $price, listOfLandMarks: $listOfLandMarks, availableLanguages: $availableLanguages)';
  }

  @override
  bool operator ==(covariant Package other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.packageUsgaeStatus == packageUsgaeStatus &&
        other.price == price &&
        listEquals(other.listOfLandMarks, listOfLandMarks) &&
        listEquals(other.availableLanguages, availableLanguages);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        packageUsgaeStatus.hashCode ^
        price.hashCode ^
        listOfLandMarks.hashCode ^
        availableLanguages.hashCode;
  }
}
