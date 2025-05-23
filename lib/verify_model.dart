import 'dart:convert';

VerifyModel verifyModelFromJson(String str) =>
    VerifyModel.fromJson(json.decode(str));

String verifyModelToJson(VerifyModel data) => json.encode(data.toJson());

class VerifyModel {
  final String? fieldName;
  final String? expiry;
  final String? dateOfBirth;
  final String? idNumber;
  final String? country;
  final String? gender;
  final String? address;
  final num? similarity;
  final bool? faceMatch;
  final num? latitude;
  final num? longitude;

  VerifyModel({
    this.fieldName,
    this.expiry,
    this.dateOfBirth,
    this.idNumber,
    this.country,
    this.gender,
    this.address,
    this.similarity,
    this.faceMatch,
    this.latitude,
    this.longitude,
  });

  VerifyModel copyWith({
    String? fieldName,
    String? expiry,
    String? dateOfBirth,
    String? idNumber,
    String? country,
    String? gender,
    String? address,
    num? similarity,
    bool? faceMatch,
    num? latitude,
    num? longitude,
  }) => VerifyModel(
    fieldName: fieldName ?? this.fieldName,
    expiry: expiry ?? this.expiry,
    dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    idNumber: idNumber ?? this.idNumber,
    country: country ?? this.country,
    gender: gender ?? this.gender,
    address: address ?? this.address,
    similarity: similarity ?? this.similarity,
    faceMatch: faceMatch ?? this.faceMatch,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
  );

  factory VerifyModel.fromJson(Map<String, dynamic> json) => VerifyModel(
    fieldName: json["field_name"],
    expiry: json["expiry"],
    dateOfBirth: json["date_of_birth"],
    idNumber: json["ID_number"],
    country: json["country"],
    gender: json["gender"],
    address: json["address"],
    similarity: json["similarity"],
    faceMatch: json["faceMatch"],
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "field_name": fieldName,
    "expiry": expiry,
    "date_of_birth": dateOfBirth,
    "ID_number": idNumber,
    "country": country,
    "gender": gender,
    "address": address,
    "similarity": similarity,
    "faceMatch": faceMatch,
    "latitude": latitude,
    "longitude": longitude,
  };
}
