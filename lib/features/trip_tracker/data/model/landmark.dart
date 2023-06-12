// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class LandMark {
  int id;
  String name;
  String imagePath;
  LatLng location;
  int time;
  LandMark({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.location,
    required this.time,
  });

  LandMark copyWith({
    int? id,
    String? name,
    String? imagePath,
    LatLng? location,
    int? time,
  }) {
    return LandMark(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      location: location ?? this.location,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imagePath': imagePath,
      'location': location,
      'time': time,
    };
  }

  factory LandMark.fromMap(Map<String, dynamic> map) {
    return LandMark(
      id: map['id'] as int,
      name: map['name'] as String,
      imagePath: map['imagePath'] as String,
      location: map['location'] as LatLng,
      time: map['time'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory LandMark.fromJson(String source) =>
      LandMark.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LandMark(id: $id, name: $name, imagePath: $imagePath, location: $location, time: $time)';
  }

  @override
  bool operator ==(covariant LandMark other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.imagePath == imagePath &&
        other.location == location &&
        other.time == time;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        imagePath.hashCode ^
        location.hashCode ^
        time.hashCode;
  }
}
