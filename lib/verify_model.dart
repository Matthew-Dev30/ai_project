import 'dart:convert';

VerifyModel verifyModelFromJson(String str) =>
    VerifyModel.fromJson(json.decode(str));

String verifyModelToJson(VerifyModel data) => json.encode(data.toJson());

class VerifyModel {
  final String? fieldName;
  final String? dateOfBirth;
  final String? idNumber;
  final String? country;
  final String? gender;
  final num? similarity;
  final bool? faceMatch;

  VerifyModel({
    this.fieldName,
    this.dateOfBirth,
    this.idNumber,
    this.country,
    this.gender,
    this.similarity,
    this.faceMatch,
  });

  VerifyModel copyWith({
    String? fieldName,
    String? dateOfBirth,
    String? idNumber,
    String? country,
    String? gender,
    num? similarity,
    bool? faceMatch,
  }) => VerifyModel(
    fieldName: fieldName ?? this.fieldName,
    dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    idNumber: idNumber ?? this.idNumber,
    country: country ?? this.country,
    gender: gender ?? this.gender,
    similarity: similarity ?? this.similarity,
    faceMatch: faceMatch ?? this.faceMatch,
  );

  factory VerifyModel.fromJson(Map<String, dynamic> json) => VerifyModel(
    fieldName: json["field_name"],
    dateOfBirth: json["date_of_birth"],
    idNumber: json["ID_number"],
    country: json["country"],
    gender: json["gender"],
    similarity: json["similarity"],
    faceMatch: json["faceMatch"],
  );

  Map<String, dynamic> toJson() => {
    "field_name": fieldName,
    "date_of_birth": dateOfBirth,
    "ID_number": idNumber,
    "country": country,
    "gender": gender,
    "similarity": similarity,
    "faceMatch": faceMatch,
  };
}
