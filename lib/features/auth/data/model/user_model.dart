import 'package:equatable/equatable.dart';
import 'package:flutix_movie/core/commons/entities/user_entity.dart';

class UserModel extends UserEntity {
  final RawUserMetaData? rawUserMetaData;

  UserModel({
    this.rawUserMetaData,
    required super.id,
    required super.email,
  }) : super(
            name: rawUserMetaData?.displayName ?? "",
            amount: rawUserMetaData?.amount ?? 0);

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
  final String? email;
  final String? displayName;
  final int? amount;

  const RawUserMetaData({
    this.email,
    this.displayName,
    this.amount,
  });

  factory RawUserMetaData.fromJson(Map<String, dynamic> json) =>
      RawUserMetaData(
        email: json["email"] ?? "",
        displayName: json["display_name"] ?? "",
        amount: json["amount"] ?? 0,
      );

  @override
  List<Object?> get props => [email, displayName, amount];
}
