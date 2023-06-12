// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// class AdminUser {
//   int id;
//   String name;
//   String email;
//   String gender;
//   String language;
//   AdminUser({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.gender,
//     required this.language,
//   });

//   AdminUser copyWith({
//     int? id,
//     String? name,
//     String? email,
//     String? gender,
//     String? language,
//   }) {
//     return AdminUser(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       email: email ?? this.email,
//       gender: gender ?? this.gender,
//       language: language ?? this.language,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'name': name,
//       'email': email,
//       'gender': gender,
//       'language': language,
//     };
//   }

//   factory AdminUser.fromMap(Map<String, dynamic> map) {
//     return AdminUser(
//       id: map['id'] as int,
//       name: map['name'] as String,
//       email: map['email'] as String,
//       gender: map['gender'] as String,
//       language: map['language'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory AdminUser.fromJson(String source) =>
//       AdminUser.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'AdminUser(id: $id, name: $name, email: $email, gender: $gender, language: $language)';
//   }

//   @override
//   bool operator ==(covariant AdminUser other) {
//     if (identical(this, other)) return true;

//     return other.id == id &&
//         other.name == name &&
//         other.email == email &&
//         other.gender == gender &&
//         other.language == language;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         name.hashCode ^
//         email.hashCode ^
//         gender.hashCode ^
//         language.hashCode;
//   }
// }
