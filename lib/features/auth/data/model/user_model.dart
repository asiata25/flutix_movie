import 'package:equatable/equatable.dart';
import 'package:flutix_movie/core/commons/entities/user_entity.dart';

class UserModel extends UserEntity {
  final RawUserMetaData? rawUserMetaData;

  UserModel({
    this.rawUserMetaData,
    required super.id,
    required super.email,
  }) : super(name: rawUserMetaData?.displayName ?? "");

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] ?? "",
        email: json["email"] ?? "",
        rawUserMetaData: json["user_metadata"] == null
            ? null
            : RawUserMetaData.fromJson(json["user_metadata"]),
      );

  UserModel copyWith({
    String? id,
    String? email,
    RawUserMetaData? rawUserMetaData,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      rawUserMetaData: rawUserMetaData ?? this.rawUserMetaData,
    );
  }
}

class RawUserMetaData extends Equatable {
  final String? sub;
  final String? email;
  final String? displayName;
  final bool? emailVerified;
  final bool? phoneVerified;

  const RawUserMetaData({
    this.sub,
    this.email,
    this.displayName,
    this.emailVerified,
    this.phoneVerified,
  });

  factory RawUserMetaData.fromJson(Map<String, dynamic> json) =>
      RawUserMetaData(
        sub: json["sub"] ?? "",
        email: json["email"]?? "",
        displayName: json["display_name"] ?? "",
        emailVerified: json["email_verified"] ?? "",
        phoneVerified: json["phone_verified"] ?? "",
      );

  @override
  List<Object?> get props => [
        sub,
        email,
        displayName,
        emailVerified,
        phoneVerified,
      ];
}
