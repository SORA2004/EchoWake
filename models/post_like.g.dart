// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostLikeImpl _$$PostLikeImplFromJson(Map<String, dynamic> json) =>
    _$PostLikeImpl(
      id: json['id'] as String?,
      userId: json['userId'] as String,
      postId: json['postId'] as String,
    );

Map<String, dynamic> _$$PostLikeImplToJson(_$PostLikeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'postId': instance.postId,
    };
