// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// class User {
//   int id;
//   String name;
//   String email;
//   String gender;
//   String phone;
//   String nationality;
//   String language;
//   int numberOfTrips;
//   User({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.gender,
//     required this.phone,
//     required this.nationality,
//     required this.language,
//     required this.numberOfTrips,
//   });

//   User copyWith({
//     int? id,
//     String? name,
//     String? email,
//     String? gender,
//     String? phone,
//     String? nationality,
//     String? language,
//     int? numberOfTrips,
//   }) {
//     return User(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       email: email ?? this.email,
//       gender: gender ?? this.gender,
//       phone: phone ?? this.phone,
//       nationality: nationality ?? this.nationality,
//       language: language ?? this.language,
//       numberOfTrips: numberOfTrips ?? this.numberOfTrips,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'name': name,
//       'email': email,
//       'gender': gender,
//       'phone': phone,
//       'nationality': nationality,
//       'language': language,
//       'numberOfTrips': numberOfTrips,
//     };
//   }

//   factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//       id: map['id'] as int,
//       name: map['name'] as String,
//       email: map['email'] as String,
//       gender: map['gender'] as String,
//       phone: map['phone'] as String,
//       nationality: map['nationality'] as String,
//       language: map['language'] as String,
//       numberOfTrips: map['numberOfTrips'] as int,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory User.fromJson(String source) =>
//       User.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'User(id: $id, name: $name, email: $email, gender: $gender, phone: $phone, nationality: $nationality, language: $language, numberOfTrips: $numberOfTrips)';
//   }

//   @override
//   bool operator ==(covariant User other) {
//     if (identical(this, other)) return true;

//     return other.id == id &&
//         other.name == name &&
//         other.email == email &&
//         other.gender == gender &&
//         other.phone == phone &&
//         other.nationality == nationality &&
//         other.language == language &&
//         other.numberOfTrips == numberOfTrips;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         name.hashCode ^
//         email.hashCode ^
//         gender.hashCode ^
//         phone.hashCode ^
//         nationality.hashCode ^
//         language.hashCode ^
//         numberOfTrips.hashCode;
//   }
// }
