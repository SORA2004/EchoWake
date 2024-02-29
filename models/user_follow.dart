import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_follow.freezed.dart';
part 'user_follow.g.dart';

@freezed
class UserFollow with _$UserFollow {
  factory UserFollow({
    String? id,
    required String userId,
    required String followId,
  }) = _UserFollow;

  factory UserFollow.fromJson(Map<String, dynamic> json) =>
      _$UserFollowFromJson(json);

  factory UserFollow.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) =>
      UserFollow.fromJson(doc.data()!).copyWith(id: doc.id);
}
