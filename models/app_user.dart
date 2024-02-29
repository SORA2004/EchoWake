import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echowake/models/converter/tmestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  factory AppUser({
    String? id,
    required String name,
    required String email,
    String? photoURL,
    String? bio,
    String? gender,
    required int postCount,
    required int followerCount,
    required int followingCount,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  factory AppUser.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) =>
      AppUser.fromJson(doc.data()!).copyWith(id: doc.id);
}
