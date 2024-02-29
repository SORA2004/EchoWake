import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echowake/models/converter/tmestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  factory Post({
    String? id,
    required String userId,
    required String name,
    required String title,
    required String audioUrl,
    required String thumbnailUrl,
    String? photoURL, // 타입을 String?로 변경
    required int likeCount,
    required int viewCount,
    required int downloadCount,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) =>
      Post.fromJson(doc.data()!).copyWith(id: doc.id);
}
