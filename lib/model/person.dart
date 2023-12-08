import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

const firestoreSerializable = JsonSerializable(
    converters: firestoreJsonConverters,
    explicitToJson: true,
    createFieldMap: true,
    createPerFieldToJson: true);

@firestoreSerializable
class Person {
  Person({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    this.email,
    this.phoneNumber,
  });

  final String firstName, middleName, lastName;
  final String? email, phoneNumber;

  String get fullName => "$firstName ${middleName[0]}. $lastName";
  String get initials => "${firstName.splitMapJoin(
        ' ',
        onNonMatch: (p0) => p0[0],
      )}${lastName[0]}";
}