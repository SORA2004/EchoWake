import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_like.freezed.dart';
part 'post_like.g.dart';

@freezed
class PostLike with _$PostLike {
  factory PostLike({
    String? id,
    required String userId,
    required String postId,
  }) = _PostLike;

  factory PostLike.fromJson(Map<String, dynamic> json) =>
      _$PostLikeFromJson(json);

  factory PostLike.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) =>
      PostLike.fromJson(doc.data()!).copyWith(id: doc.id);
}
