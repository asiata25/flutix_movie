import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? instanceId;
  final String? id;
  final String? aud;
  final String? role;
  final String? email;
  final String? encryptedPassword;
  final String? emailConfirmedAt;
  final dynamic invitedAt;
  final String? confirmationToken;
  final dynamic confirmationSentAt;
  final String? recoveryToken;
  final dynamic recoverySentAt;
  final String? emailChangeTokenNew;
  final String? emailChange;
  final dynamic emailChangeSentAt;
  final String? lastSignInAt;
  final RawAppMetaData? rawAppMetaData;
  final RawUserMetaData? rawUserMetaData;
  final dynamic isSuperAdmin;
  final String? createdAt;
  final String? updatedAt;
  final dynamic phone;
  final dynamic phoneConfirmedAt;
  final String? phoneChange;
  final String? phoneChangeToken;
  final dynamic phoneChangeSentAt;
  final String? confirmedAt;
  final String? emailChangeTokenCurrent;
  final int? emailChangeConfirmStatus;
  final dynamic bannedUntil;
  final String? reauthenticationToken;
  final dynamic reauthenticationSentAt;
  final bool? isSsoUser;
  final dynamic deletedAt;
  final bool? isAnonymous;

  const UserEntity({
    this.instanceId,
    this.id,
    this.aud,
    this.role,
    this.email,
    this.encryptedPassword,
    this.emailConfirmedAt,
    this.invitedAt,
    this.confirmationToken,
    this.confirmationSentAt,
    this.recoveryToken,
    this.recoverySentAt,
    this.emailChangeTokenNew,
    this.emailChange,
    this.emailChangeSentAt,
    this.lastSignInAt,
    this.rawAppMetaData,
    this.rawUserMetaData,
    this.isSuperAdmin,
    this.createdAt,
    this.updatedAt,
    this.phone,
    this.phoneConfirmedAt,
    this.phoneChange,
    this.phoneChangeToken,
    this.phoneChangeSentAt,
    this.confirmedAt,
    this.emailChangeTokenCurrent,
    this.emailChangeConfirmStatus,
    this.bannedUntil,
    this.reauthenticationToken,
    this.reauthenticationSentAt,
    this.isSsoUser,
    this.deletedAt,
    this.isAnonymous,
  });

  @override
  List<Object?> get props => [
        instanceId,
        id,
        aud,
        role,
        email,
        encryptedPassword,
        emailConfirmedAt,
        invitedAt,
        confirmationToken,
        confirmationSentAt,
        recoveryToken,
        recoverySentAt,
        emailChangeTokenNew,
        emailChange,
        emailChangeSentAt,
        lastSignInAt,
        rawAppMetaData,
        rawUserMetaData,
        isSuperAdmin,
        createdAt,
        updatedAt,
        phone,
        phoneConfirmedAt,
        phoneChange,
        phoneChangeToken,
        phoneChangeSentAt,
        confirmedAt,
        emailChangeTokenCurrent,
        emailChangeConfirmStatus,
        bannedUntil,
        reauthenticationToken,
        reauthenticationSentAt,
        isSsoUser,
        deletedAt,
        isAnonymous,
      ];
}

class RawAppMetaData extends Equatable {
  final String? provider;
  final List<String>? providers;

  const RawAppMetaData({
    this.provider,
    this.providers,
  });

  factory RawAppMetaData.fromJson(Map<String, dynamic> json) => RawAppMetaData(
        provider: json["provider"],
        providers: json["providers"] == null
            ? []
            : List<String>.from(json["providers"]!.map((x) => x)),
      );

  @override
  List<Object?> get props => [provider, providers];
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
        sub: json["sub"],
        email: json["email"],
        displayName: json["display_name"],
        emailVerified: json["email_verified"],
        phoneVerified: json["phone_verified"],
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
