// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:zeyarah/features/trip_tracker/data/model/driver.dart';
import 'package:zeyarah/features/trip_packages/data/model/package.dart';

class Trip {
  int id;
  DateTime startingDateTime;
  DateTime endDateTime;
  String status;
  Driver driver;
  Package package;
  double rate;
  int price;
  double extraCost;
  double finalPrice;
  Trip({
    required this.id,
    required this.startingDateTime,
    required this.endDateTime,
    required this.status,
    required this.driver,
    required this.package,
    required this.rate,
    required this.price,
    required this.extraCost,
    required this.finalPrice,
  });

  Trip copyWith({
    int? id,
    DateTime? startingDateTime,
    DateTime? endDateTime,
    String? status,
    Driver? driver,
    Package? package,
    double? rate,
    int? price,
    double? extraCost,
    double? finalPrice,
  }) {
    return Trip(
      id: id ?? this.id,
      startingDateTime: startingDateTime ?? this.startingDateTime,
      endDateTime: endDateTime ?? this.endDateTime,
      status: status ?? this.status,
      driver: driver ?? this.driver,
      package: package ?? this.package,
      rate: rate ?? this.rate,
      price: price ?? this.price,
      extraCost: extraCost ?? this.extraCost,
      finalPrice: finalPrice ?? this.finalPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'startingDateTime': startingDateTime.millisecondsSinceEpoch,
      'endDateTime': endDateTime.millisecondsSinceEpoch,
      'status': status,
      'driver': driver.toMap(),
      'package': package.toMap(),
      'rate': rate,
      'price': price,
      'extraCost': extraCost,
      'finalPrice': finalPrice,
    };
  }

  factory Trip.fromMap(Map<String, dynamic> map) {
    return Trip(
      id: map['id'] as int,
      startingDateTime:
          DateTime.fromMillisecondsSinceEpoch(map['startingDateTime'] as int),
      endDateTime:
          DateTime.fromMillisecondsSinceEpoch(map['endDateTime'] as int),
      status: map['status'] as String,
      driver: Driver.fromMap(map['driver'] as Map<String, dynamic>),
      package: Package.fromMap(map['package'] as Map<String, dynamic>),
      rate: map['rate'] as double,
      price: map['price'] as int,
      extraCost: map['extraCost'] as double,
      finalPrice: map['finalPrice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Trip.fromJson(String source) =>
      Trip.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Trip(id: $id, startingDateTime: $startingDateTime, endDateTime: $endDateTime, status: $status, driver: $driver, package: $package, rate: $rate, price: $price, extraCost: $extraCost, finalPrice: $finalPrice)';
  }

  @override
  bool operator ==(covariant Trip other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.startingDateTime == startingDateTime &&
        other.endDateTime == endDateTime &&
        other.status == status &&
        other.driver == driver &&
        other.package == package &&
        other.rate == rate &&
        other.price == price &&
        other.extraCost == extraCost &&
        other.finalPrice == finalPrice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        startingDateTime.hashCode ^
        endDateTime.hashCode ^
        status.hashCode ^
        driver.hashCode ^
        package.hashCode ^
        rate.hashCode ^
        price.hashCode ^
        extraCost.hashCode ^
        finalPrice.hashCode;
  }
}
