// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:zeyarah/models/admin_user.dart';
// import 'package:zeyarah/features/trip_tracker/data/model/driver.dart';
// import 'package:zeyarah/features/trip_packages/data/model/package.dart';
// import 'package:zeyarah/models/user.dart';

// class Complaints {
//   int id;
//   DateTime dateTime;
//   User user;
//   Driver driver;
//   String status;
//   String comments;
//   Package relatedPackage;
//   AdminUser personHandling;
//   Complaints({
//     required this.id,
//     required this.dateTime,
//     required this.user,
//     required this.driver,
//     required this.status,
//     required this.comments,
//     required this.relatedPackage,
//     required this.personHandling,
//   });

//   Complaints copyWith({
//     int? id,
//     DateTime? dateTime,
//     User? user,
//     Driver? driver,
//     String? status,
//     String? comments,
//     Package? relatedPackage,
//     AdminUser? personHandling,
//   }) {
//     return Complaints(
//       id: id ?? this.id,
//       dateTime: dateTime ?? this.dateTime,
//       user: user ?? this.user,
//       driver: driver ?? this.driver,
//       status: status ?? this.status,
//       comments: comments ?? this.comments,
//       relatedPackage: relatedPackage ?? this.relatedPackage,
//       personHandling: personHandling ?? this.personHandling,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'dateTime': dateTime.millisecondsSinceEpoch,
//       'user': user.toMap(),
//       'driver': driver.toMap(),
//       'status': status,
//       'comments': comments,
//       'relatedPackage': relatedPackage.toMap(),
//       'personHandling': personHandling.toMap(),
//     };
//   }

//   factory Complaints.fromMap(Map<String, dynamic> map) {
//     return Complaints(
//       id: map['id'] as int,
//       dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
//       user: User.fromMap(map['user'] as Map<String, dynamic>),
//       driver: Driver.fromMap(map['driver'] as Map<String, dynamic>),
//       status: map['status'] as String,
//       comments: map['comments'] as String,
//       relatedPackage:
//           Package.fromMap(map['relatedPackage'] as Map<String, dynamic>),
//       personHandling:
//           AdminUser.fromMap(map['personHandling'] as Map<String, dynamic>),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Complaints.fromJson(String source) =>
//       Complaints.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'Complaints(id: $id, dateTime: $dateTime, user: $user, driver: $driver, status: $status, comments: $comments, relatedPackage: $relatedPackage, personHandling: $personHandling)';
//   }

//   @override
//   bool operator ==(covariant Complaints other) {
//     if (identical(this, other)) return true;

//     return other.id == id &&
//         other.dateTime == dateTime &&
//         other.user == user &&
//         other.driver == driver &&
//         other.status == status &&
//         other.comments == comments &&
//         other.relatedPackage == relatedPackage &&
//         other.personHandling == personHandling;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         dateTime.hashCode ^
//         user.hashCode ^
//         driver.hashCode ^
//         status.hashCode ^
//         comments.hashCode ^
//         relatedPackage.hashCode ^
//         personHandling.hashCode;
//   }
// }
