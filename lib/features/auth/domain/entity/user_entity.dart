class UserEntity {
  String? instanceId;
  String? id;
  String? aud;
  String? role;
  String? email;
  String? encryptedPassword;
  String? emailConfirmedAt;
  dynamic invitedAt;
  String? confirmationToken;
  dynamic confirmationSentAt;
  String? recoveryToken;
  dynamic recoverySentAt;
  String? emailChangeTokenNew;
  String? emailChange;
  dynamic emailChangeSentAt;
  String? lastSignInAt;
  RawAppMetaData? rawAppMetaData;
  RawUserMetaData? rawUserMetaData;
  dynamic isSuperAdmin;
  String? createdAt;
  String? updatedAt;
  dynamic phone;
  dynamic phoneConfirmedAt;
  String? phoneChange;
  String? phoneChangeToken;
  dynamic phoneChangeSentAt;
  String? confirmedAt;
  String? emailChangeTokenCurrent;
  int? emailChangeConfirmStatus;
  dynamic bannedUntil;
  String? reauthenticationToken;
  dynamic reauthenticationSentAt;
  bool? isSsoUser;
  dynamic deletedAt;
  bool? isAnonymous;

  UserEntity({
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
}

class RawAppMetaData {
  String? provider;
  List<String>? providers;

  RawAppMetaData({
    this.provider,
    this.providers,
  });

  factory RawAppMetaData.fromJson(Map<String, dynamic> json) => RawAppMetaData(
        provider: json["provider"],
        providers: json["providers"] == null
            ? []
            : List<String>.from(json["providers"]!.map((x) => x)),
      );
}

class RawUserMetaData {
  String? sub;
  String? email;
  String? displayName;
  bool? emailVerified;
  bool? phoneVerified;

  RawUserMetaData({
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
}
