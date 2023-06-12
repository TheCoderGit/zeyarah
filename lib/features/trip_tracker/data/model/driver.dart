// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Driver {
  int id;
  String name;
  String email;
  String gender;
  String phone;
  String nationaID;
  String car;
  String nationality;
  List<String> languages;
  String averageRate;
  int numberOfComplints;
  int numberOfTrips;
  Driver({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.phone,
    required this.nationaID,
    required this.car,
    required this.nationality,
    required this.languages,
    required this.averageRate,
    required this.numberOfComplints,
    required this.numberOfTrips,
  });

  Driver copyWith({
    int? id,
    String? name,
    String? email,
    String? gender,
    String? phone,
    String? nationaID,
    String? car,
    String? nationality,
    List<String>? languages,
    String? averageRate,
    int? numberOfComplints,
    int? numberOfTrips,
  }) {
    return Driver(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      phone: phone ?? this.phone,
      nationaID: nationaID ?? this.nationaID,
      car: car ?? this.car,
      nationality: nationality ?? this.nationality,
      languages: languages ?? this.languages,
      averageRate: averageRate ?? this.averageRate,
      numberOfComplints: numberOfComplints ?? this.numberOfComplints,
      numberOfTrips: numberOfTrips ?? this.numberOfTrips,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'gender': gender,
      'phone': phone,
      'nationaID': nationaID,
      'car': car,
      'nationality': nationality,
      'languages': languages,
      'averageRate': averageRate,
      'numberOfComplints': numberOfComplints,
      'numberOfTrips': numberOfTrips,
    };
  }

  factory Driver.fromMap(Map<String, dynamic> map) {
    return Driver(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      gender: map['gender'] as String,
      phone: map['phone'] as String,
      nationaID: map['nationaID'] as String,
      car: map['car'] as String,
      nationality: map['nationality'] as String,
      languages: List<String>.from(map['languages'] as List<String>),
      averageRate: map['averageRate'] as String,
      numberOfComplints: map['numberOfComplints'] as int,
      numberOfTrips: map['numberOfTrips'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Driver.fromJson(String source) =>
      Driver.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Driver(id: $id, name: $name, email: $email, gender: $gender, phone: $phone, nationaID: $nationaID, car: $car, nationality: $nationality, languages: $languages, averageRate: $averageRate, numberOfComplints: $numberOfComplints, numberOfTrips: $numberOfTrips)';
  }

  @override
  bool operator ==(covariant Driver other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.gender == gender &&
        other.phone == phone &&
        other.nationaID == nationaID &&
        other.car == car &&
        other.nationality == nationality &&
        listEquals(other.languages, languages) &&
        other.averageRate == averageRate &&
        other.numberOfComplints == numberOfComplints &&
        other.numberOfTrips == numberOfTrips;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        gender.hashCode ^
        phone.hashCode ^
        nationaID.hashCode ^
        car.hashCode ^
        nationality.hashCode ^
        languages.hashCode ^
        averageRate.hashCode ^
        numberOfComplints.hashCode ^
        numberOfTrips.hashCode;
  }
}
